//AppLocalizations.of(context)!.appTitle,
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'common/configs/hive/hive_config.dart';
import 'common/configs/lang/translate_preferences.dart';
import 'common/constants/language_constants.dart';
import 'common/di/di.dart';
import 'common/initializer/init.dart';
import 'presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  final delegate = await LocalizationDelegate.create(
    fallbackLocale: LanguageConstants.en,
    supportedLocales: [
      LanguageConstants.vi,
      LanguageConstants.en,
    ],
    preferences: TranslatePreferences(
      getIt<HiveConfig>(),
    ),
  );
  runApp(
    LocalizedApp(
      delegate,
      const App(),
    ),
  );
}
