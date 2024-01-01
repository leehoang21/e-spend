import 'dart:ui';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:injectable/injectable.dart';

@singleton
class TranslatePreferences extends ITranslatePreferences {
  final HiveConfig hiveConfig;
  final FirebaseConfig config;

  TranslatePreferences(this.hiveConfig, this.config);
  @override
  Future<Locale?> getPreferredLocale() async {
    final lang = hiveConfig.locale;
    config.auth.setLanguageCode(lang.languageCode);
    return lang;
  }

  @override
  Future savePreferredLocale(Locale locale) async {
    await hiveConfig.appBox.put(DefaultEnvironment.lang, locale.languageCode);
    config.auth.setLanguageCode(locale.languageCode);

    return true;
  }
}
