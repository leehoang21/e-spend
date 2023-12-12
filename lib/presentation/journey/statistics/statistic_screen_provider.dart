import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/statistics/cubit/statistic_cubit.dart';

import 'statistic_screen.dart';

@RoutePage()
class StatisticScreenProvider extends StatefulWidget {
  const StatisticScreenProvider({super.key});

  @override
  State<StatisticScreenProvider> createState() =>
      _StatisticScreenProviderState();
}

class _StatisticScreenProviderState extends State<StatisticScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<StatisticCubit>(),
      child: const StatisticScreen(),
    );
  }
}
