import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/configs/notification/notification_config.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/data/models/category_model.dart';
import 'package:flutter_e_spend/domain/repositories/statistics_repository.dart';
import 'package:flutter_e_spend/domain/repositories/transaction_repository.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
import 'package:notifications/notifications.dart';
import '../../../data/models/transaction_model.dart';
import '../../../data/models/wallet_model.dart';
import '../../utils/app_utils.dart';
import '../hive/hive_config.dart';

part 'mapper.dart';

class NotificationService {
  Notifications? _notifications;

  Future<void> initPlatformState() async {
    startListening();
  }

  void startListening() async {
    _notifications = Notifications();
    try {
      final hiveConfig = getIt.get<HiveConfig>();
      final firebaseConfig = getIt.get<FirebaseConfig>();
      final transactionRepository = getIt.get<TransactionRepository>();
      final statisticsRepository = getIt.get<StatisticsRepository>();
      final notificationConfig = getIt.get<NotificationConfig>();

      final bool status =
          await NotificationListenerService.isPermissionGranted();
      if (!status) return;

      _notifications!.notificationStream!.listen(
        (event) {
          return onData(
            event,
            hiveConfig,
            firebaseConfig,
            transactionRepository,
            statisticsRepository,
            notificationConfig,
          );
        },
      );

      /// stream the incoming notification events
    } catch (e) {
      logger('start transaction error $e');
    }
  }

  void onData(
    NotificationEvent event,
    HiveConfig hiveConfig,
    FirebaseConfig firebaseConfig,
    TransactionRepository transactionRepository,
    StatisticsRepository statisticsRepository,
    NotificationConfig notificationConfig,
  ) async {
    try {
      if (firebaseConfig.auth.currentUser != null &&
          listBankSupport.contains(
            event.packageName,
          )) {
        final map = mapNotificationToTransaction(event);
        try {
          await transactionRepository.create(map.$1, map.$2, map.$1.wallet.id);
        } catch (_) {}
        try {
          await statisticsRepository.update(map.$1);
        } catch (_) {}

        await notificationConfig.pushNotification(
          NotificationEvent(
            packageName: event.packageName,
            title: 'Thông báo tạo giao dịch tự động',
            message: map.$1.note,
            timeStamp: event.timeStamp,
          ),
        );
        // FlutterForegroundTask.updateService(
        //   notificationTitle: 'transaction',
        //   callback: startCallback,
        // );

        // // Send data to the main isolate.
        // sendPort?.send(event);
      }
    } catch (e) {
      logger('token login $e');
    }
  }
}


// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();

//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       // this will be executed when app is in foreground or background in separated isolate
//       onStart: onStart,
//       // auto start service

//       isForegroundMode: true,

//       initialNotificationTitle: 'ESPEND SERVICE',
//       initialNotificationContent: 'Initializing',
//     ),
//     iosConfiguration: IosConfiguration(
//       // this will be executed when app is in foreground in separated isolate
//       onForeground: onStart,

//       // you have to enable background fetch capability on xcode project
//       onBackground: onIosBackground,
//     ),
//   );
// }

// // to ensure this is executed
// // run app from xcode, then from xcode menu, select Simulate Background Fetch

// @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();

//   logger('ios backgroung service');
//   return true;
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // For flutter prior to version 3.0.0
//   // We have to register the plugin manually

//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });

//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }

//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });

//   // bring to foreground
//   start();
// }
