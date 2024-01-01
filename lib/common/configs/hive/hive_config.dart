import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/user_model.dart';
import 'hive_box_name.dart';
import 'hive_type_id.dart';

@singleton
class HiveConfig {
  late Box<dynamic> appBox;

  @postConstruct
  init() async {
    await Hive.initFlutter();
    Hive.isAdapterRegistered(HiveTypeId.userType)
        ? logger('HiveTypeId.userType is registered')
        : Hive.registerAdapter(UserModelAdapter());
    await openBox();
  }

  Future initAsync() async {
    await Hive.initFlutter();
    Hive.isAdapterRegistered(HiveTypeId.userType)
        ? logger('HiveTypeId.userType is registered')
        : Hive.registerAdapter(UserModelAdapter());
    Hive.isBoxOpen(HiveBoxName.appBox)
        ? logger('HiveBoxName.appBox is open')
        : await openBox();
  }

  Future openBox() async {
    appBox = await Hive.openBox(HiveBoxName.appBox);
  }

  UserModel? get user => appBox.get(DefaultEnvironment.user) as UserModel?;
  ThemeData get theme =>
      appBox.get(DefaultEnvironment.theme) as String == 'dark'
          ? ThemeData.dark()
          : ThemeData.light();
  Locale get locale =>
      Locale(appBox.get(DefaultEnvironment.lang) as String? ?? 'en');

  String get localAuthId {
    final uId = appBox.get(DefaultEnvironment.localAuth) as String? ?? '';
    return uId;
  }

  bool get isLocalAuth => localAuthId == user?.uId;

  set setUser(UserModel? user) {
    try {
      appBox.put(DefaultEnvironment.user, user);
    } catch (_) {}
  }

  set setTheme(ThemeData theme) {
    try {
      appBox.put(DefaultEnvironment.theme, theme.brightness.toString());
    } catch (_) {}
  }

  set setLocale(Locale locale) {
    try {
      appBox.put(DefaultEnvironment.lang, locale.languageCode);
    } catch (_) {}
  }

  set setLocalAuthId(String id) {
    try {
      appBox.put(DefaultEnvironment.localAuth, id);
    } catch (e) {
      logger('setLocalAuthId$e');
    }
  }
}
