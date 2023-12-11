import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/user_model.dart';
import 'hive_box_name.dart';

@singleton
class HiveConfig {
  late Box<dynamic> appBox;

  @postConstruct
  init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await openBox();
  }

  Future openBox() async {
    appBox = await Hive.openBox(HiveBoxName.appBox);
  }

  Future setLocalAuth(bool value) async {
    await appBox.put(DefaultEnvironment.localAuth, value);
  }

  UserModel? get user => appBox.get(DefaultEnvironment.user) as UserModel?;
  ThemeData get theme =>
      appBox.get(DefaultEnvironment.theme) as String == 'dark'
          ? ThemeData.dark()
          : ThemeData.light();
  Locale get locale =>
      Locale(appBox.get(DefaultEnvironment.lang) as String? ?? 'en');
  bool get localAuth =>
      appBox.get(DefaultEnvironment.localAuth) as bool? ?? false;
}
