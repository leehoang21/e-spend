import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/bloc_observer.dart';
import '../di/di.dart';
//dart pub global run fvm:main flutter pub run build_runner watch --delete-conflicting-outputs

class AppInitializer {
  static Future<void> init() async {
    //set Orientations portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Bloc.observer = MyBlocObserver();
    configureDependencies();
  }
}
