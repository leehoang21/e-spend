import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

import '../../../firebase_options.dart';
import '../../enums/app_enums.dart';
import '../dio/dio_config.dart';
import 'notification_service.dart';

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
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await hiveConfig.initAsync();
    final result = await requestPermission();
    if (!result) return;
    await getToken();
    await onOpenApp();
    await onForeground();
    await onMessageBackground();
    pushNotification();
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

  Future sendNotification(token) async {
    try {
      final data = {
        "message": {
          "token": token,
          "data": {
            "isScheduled": "true",
            "scheduledTime": "2024-01-01 10:20:00"
          },
          "notification": {
            "title": "FCM Message",
            "body": "This is an FCM notification message!",
          }
        }
      };
      final response = await dioApiClient.request(
        method: NetworkMethod.post,
        url: DefaultEnvironment.notificationHost,
        header: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ya29.a0AfB_byBpU_H_a7QdobLsuhGdzA6xqy4KXTVlIBkggzCYseM_tArUPhhZF1VvZjwahG5eSMSzO9V-wR9NV_D2e-rKQjjrCKOYpbdPIM8L1GSFZVjRHXwHXjizlnIejkdLnNA35FyGWnaxfUzcWw7c84IO9Z6d9wL-Z7s7aCgYKAQQSARASFQHGX2MiOeD4ncUBh9T_E2USMQqPuQ0171'
        },
        data: data,
      );
      log('response: ${response.data}');
    } catch (e) {
      log('error: $e');
    }
  }

  pushNotification() async {
    final tokens = await getTokenRemote();
    if (tokens.isNotEmpty) {
      for (final token in tokens) {
        await sendNotification(token);
      }
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
    log("token: $token");
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
