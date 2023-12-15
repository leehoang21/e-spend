import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/planning/cubit/planning_cubit.dart';
import 'package:flutter_e_spend/presentation/journey/planning/planning_screen.dart';

@RoutePage()
class PlanningScreenProvider extends StatefulWidget {
  const PlanningScreenProvider({super.key});

  @override
  State<PlanningScreenProvider> createState() => _PlanningScreenProviderState();
}

class _PlanningScreenProviderState extends State<PlanningScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<PlanningCubit>(),
      child: const PlanningScreen(),
    );
  }
}
