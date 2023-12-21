import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';

import 'buget_screen.dart';
import 'cubit/buget_cubit.dart';

@RoutePage()
class BugetScreenProvider extends StatefulWidget {
  const BugetScreenProvider({super.key});

  @override
  State<BugetScreenProvider> createState() => _BugetScreenProviderState();
}

class _BugetScreenProviderState extends State<BugetScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<BugetCubit>(),
      child: const BugetScreen(),
    );
  }
}
