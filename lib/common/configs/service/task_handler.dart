// part of 'service.dart';

// void startListening() async {
//   try {
//     configureDependencies();
//     final hiveConfig = getIt.get<HiveConfig>();
//     final firebaseConfig = getIt.get<FirebaseConfig>();
//     final transactionRepository = getIt.get<TransactionRepository>();
//     final bool status = await NotificationListenerService.isPermissionGranted();
//     if (!status) {
//       await NotificationListenerService.requestPermission();
//     }

//     NotificationListenerService.notificationsStream.listen(
//       (event) {
//         logger('_onData: ${event.toString()}');
//         return onData(
//           event,
//           hiveConfig,
//           firebaseConfig,
//           transactionRepository,
//         );
//       },
//     );

//     /// stream the incoming notification events
//   } catch (e) {
//     logger('start transaction error $e');
//   }
// }

// void onData(
//   ServiceNotificationEvent event,
//   HiveConfig hiveConfig,
//   FirebaseConfig firebaseConfig,
//   TransactionRepository transactionRepository,
// ) async {
//   String token = '';
//   try {
//     logger('_onData: ${event.toString()}');

//     token = hiveConfig.user?.token ?? '';
//     logger('token: $token');
//   } catch (e) {
//     logger(e);
//   }
//   try {
//     if (firebaseConfig.auth.currentUser == null) {
//       await firebaseConfig.auth.signInWithCustomToken(token);
//     }
//     if (firebaseConfig.auth.currentUser != null &&
//         listBankSupport.contains(
//           event.packageName,
//         )) {
//       final map = mapNotificationToTransaction(event);
//       await transactionRepository.create(map.$1, map.$2);
//       // FlutterForegroundTask.updateService(
//       //   notificationTitle: 'transaction',
//       //   callback: startCallback,
//       // );

//       // // Send data to the main isolate.
//       // sendPort?.send(event);
//     }
//   } catch (e) {
//     logger('token login $e');
//   }
// }
