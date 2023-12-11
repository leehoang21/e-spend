import 'package:flutter/material.dart';
import '../../presentation/bloc/loading_bloc/loading_bloc.dart';
import '../../presentation/routers/app_router.dart';
import 'di.dart';

class Injector {
  static showLoading() {
    final LoadingBloc loadingBloc = getIt.get<LoadingBloc>();

    loadingBloc.startLoading();
  }

  static hideLoading() {
    final LoadingBloc loadingBloc = getIt.get<LoadingBloc>();

    loadingBloc.finishLoading();
  }

  static BuildContext get context =>
      getIt.get<AppRouter>().navigatorKey.currentContext!;
}
