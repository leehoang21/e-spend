import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../common/configs/firebase_config.dart';
import '../../common/di/di.dart';
import 'dart:developer' as developer;

import '../../common/utils/app_utils.dart';
import '../bloc/loading_bloc/loading_bloc.dart';
import '../widgets/change_time/time/time_cubit.dart';
import '../widgets/loading_widget/loading_container_widget.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        developer.log("app in resume");
        break;
      case AppLifecycleState.inactive:
        developer.log("app in inactive");
        break;
      case AppLifecycleState.hidden:
        developer.log("app in hidden");
        break;
      case AppLifecycleState.paused:
        developer.log("app in paused");
        break;
      case AppLifecycleState.detached:
        developer.log("app in detached");
        break;
      default:
        developer.log("app in hiddens");
    }
  }

  @override
  void dispose() {
    try {
      getIt.get<FirebaseConfig>().auth.signOut();
      getIt.get<HiveConfig>().clear();
    } catch (e) {
      logger(e.toString());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return ScreenUtilInit(
        designSize: const Size(
          LayoutConstants.widthDefault,
          LayoutConstants.heightDefault,
        ),
        builder: (context, child) => GestureDetector(
              onTap: () {
                final currentFocus = FocusScope.of(context);
                FocusManager.instance.primaryFocus?.unfocus();
                currentFocus.unfocus();
              },
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => getIt.get<LoadingBloc>(),
                  ),
                  BlocProvider(
                    create: (_) => getIt.get<TimeCubit>(),
                  ),
                ],
                child: MaterialApp.router(
                  routerConfig: getIt.get<AppRouter>().config(),
                  title: StringConstants.appTitle,
                  locale: localizationDelegate.currentLocale,
                  supportedLocales: localizationDelegate.supportedLocales,
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    localizationDelegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  theme: appTheme(),
                  builder: (context, widget) {
                    return LoadingContainerWidget(
                      child: widget ?? const SizedBox(),
                    );
                  },
                ),
              ),
            ));
  }
}
