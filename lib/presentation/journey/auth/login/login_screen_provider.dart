import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/auth/login/cubit/login_cubit.dart';
import 'package:flutter_e_spend/presentation/journey/auth/login/login_screen.dart';

@RoutePage()
class LoginScreenProvider extends StatefulWidget {
  const LoginScreenProvider({super.key});

  @override
  State<LoginScreenProvider> createState() => _LoginScreenProviderState();
}

class _LoginScreenProviderState extends State<LoginScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: LoginScreen(),
    );
  }
}
