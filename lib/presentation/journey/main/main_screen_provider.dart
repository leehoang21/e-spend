import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/main/main_screen.dart';

import 'bloc/tab_manger_cubit.dart';

@RoutePage()
class MainScreenProvider extends StatelessWidget {
  const MainScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<TabMangerCubit>(),
      child: const MainScreen(),
    );
  }
}
