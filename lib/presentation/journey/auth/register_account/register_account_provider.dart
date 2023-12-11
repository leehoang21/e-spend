import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/auth/register_account/cubit/register_account_cubit.dart';

import 'register_account.dart';

@RoutePage()
class RegisterAccountScreenProvider extends StatefulWidget {
  const RegisterAccountScreenProvider({super.key});

  @override
  State<RegisterAccountScreenProvider> createState() =>
      _RegisterAccountScreenProviderState();
}

class _RegisterAccountScreenProviderState
    extends State<RegisterAccountScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<RegisterAccountCubit>(),
      child: RegisterAccountScreen(),
    );
  }
}
