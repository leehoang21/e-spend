import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
import '../../presentation/bloc/bloc_observer.dart';
import '../configs/service/service.dart';
import '../di/di.dart';
//dart pub global run fvm:main flutter pub run build_runner watch --delete-conflicting-outputs

class AppInitializer {
  static Future<void> init() async {
    final bool status = await NotificationListenerService.isPermissionGranted();
    if (!status) {
      await NotificationListenerService.requestPermission();
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColor.backgroundColor));
    Bloc.observer = MyBlocObserver();
    configureDependencies();
    NotificationService().startListening();
  }
}
