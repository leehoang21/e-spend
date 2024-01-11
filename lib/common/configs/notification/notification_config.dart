import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:notifications/notifications.dart';
import '../../../firebase_options.dart';
import '../../enums/app_enums.dart';
import '../dio/dio_config.dart';
import 'notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

@lazySingleton
class NotificationConfig {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final HiveConfig hiveConfig = HiveConfig();
  final DioApiClient dioApiClient;

  NotificationConfig(this.dioApiClient);

  CollectionReference<Map<String, dynamic>> get _userDoc =>
      FirebaseFirestore.instance
          .collection(DefaultEnvironment.environmentHome)
          .doc(DefaultEnvironment.environment)
          .collection(hiveConfig.user?.uId ?? '')
          .doc(DefaultEnvironment.customer)
          .collection(DefaultEnvironment.fcmToken);

  config() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (_) {}
    await hiveConfig.initAsync();
    final result = await requestPermission();
    if (!result) return;
    await getToken();
    await onOpenApp();
    await onForeground();
    await onMessageBackground();
  }

  Future<bool> requestPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return true;
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      return true;
    } else {
      return false;
    }
  }

  Future schedule(NotificationEvent event) async {
    final id = Random.secure().nextInt(100000000);
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    for (final pendingNotificationRequest in pendingNotificationRequests) {
      if (pendingNotificationRequest.id == id) {
        return;
      }
    }
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    await flutterLocalNotificationsPlugin.zonedSchedule(
        Random.secure().nextInt(100000000),
        event.title,
        event.message,
        tz.TZDateTime.parse(tz.local, event.timeStamp!.toIso8601String()),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'schedule channel',
            'schedule channel',
            channelDescription: 'schedule channel description',
            importance: Importance.max,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future sendNotification(String token, NotificationEvent event) async {
    try {
      final data = {
        "message": {
          "token": token,
          "notification": {
            "title": event.title ?? 'title',
            "body": event.message ?? 'body',
          }
        }
      };
      final result = await dioApiClient.request(
        method: NetworkMethod.post,
        url: DefaultEnvironment.notificationHost,
        header: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ya29.a0AfB_byDhwSkn9g3VZRx-6QInMoZW5PDwxVpY5ZbojQ9dHCD4MQ4cnCFzc86UnSc6R0zdfvkfJlb3uFaBvNZ7Lbkp43Slh0vb40oDuup_iB6nI86ZsOiu6igresVOPkyjpUAuA3KMB5cOpWpb9ipfPFXa2YI9r503kYEaCgYKASoSARASFQHGX2MijC7f_mmqgy1Yv3VGI5id7w0170'
        },
        data: data,
      );
      logger(result);
    } catch (e) {
      logger(e.toString());
    }
  }

  pushNotification(
    NotificationEvent event,
  ) async {
    try {
      final tokens = await getTokenRemote();
      if (tokens.isNotEmpty) {
        for (final token in tokens) {
          await sendNotification(token, event);
        }
      }
    } catch (e) {
      logger(e.toString());
    }
  }

  onOpenApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
      // Get.toNamed(Routes.notification);
    });
  }

  onOpenAppInit() {
    FirebaseMessaging.instance.getInitialMessage().then((value) => {
          if (value != null) {if (value.notification != null) {}}
        });
  }

  clearNotification() {
    flutterLocalNotificationsPlugin.cancelAll();
  }

  onMessageBackground() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken(vapidKey: "");
    logger("token: $token");
    if (isNullEmpty(token) || token == hiveConfig.fvmToken) {
      return;
    }
    hiveConfig.setFcmToken = token;
    sendTokenToServer(token);
  }

  Future<List<String>> getTokenRemote() async {
    try {
      final result = await _userDoc.get();

      final list = result.docs
          .map((e) => e.data()[DefaultEnvironment.fcmToken] as String)
          .toList();
      return list;
    } catch (e) {
      return [];
    }
  }

  sendTokenToServer(String? token) async {
    if (isNullEmpty(token)) {
      return;
    }
    _userDoc.add(
      {
        DefaultEnvironment.fcmToken: token,
      },
    );
  }

  Future<void> onForeground() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? apple = message.notification?.apple;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        await flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher_round',
              //sound: RawResourceAndroidNotificationSound(android.sound),
            ),
          ),
        );
      } else if (notification != null && apple != null) {
        await flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              subtitle: apple.subtitle,
            ),
          ),
        );
      }
    });
  }
}
