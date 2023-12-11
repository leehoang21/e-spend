import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/statistics/cubit/statistic_cubit.dart';

import 'statistic_screen.dart';

class StatisticCcreenProvider extends StatefulWidget {
  const StatisticCcreenProvider({super.key});

  @override
  State<StatisticCcreenProvider> createState() =>
      _StatisticCcreenProviderState();
}

class _StatisticCcreenProviderState extends State<StatisticCcreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<StatisticCubit>(),
      child: const StatisticScreen(),
    );
  }
}
