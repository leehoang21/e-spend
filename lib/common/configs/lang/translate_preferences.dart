import 'dart:ui';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:injectable/injectable.dart';

@singleton
class TranslatePreferences extends ITranslatePreferences {
  final HiveConfig hiveConfig;

  TranslatePreferences(
    this.hiveConfig,
  );
  @override
  Future<Locale?> getPreferredLocale() async {
    final lang = hiveConfig.locale;

    return lang;
  }

  @override
  Future savePreferredLocale(Locale locale) async {
    await hiveConfig.appBox.put(DefaultEnvironment.lang, locale.languageCode);

    return true;
  }
}
