import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/auth/register/cubit/register_cubit.dart';
import 'package:flutter_e_spend/presentation/journey/auth/register/register_screen.dart';

@RoutePage()
class RegisterScreenProvider extends StatefulWidget {
  const RegisterScreenProvider({
    super.key,
  });

  @override
  State<RegisterScreenProvider> createState() => _RegisterScreenProviderState();
}

class _RegisterScreenProviderState extends State<RegisterScreenProvider> {
  late final RegisterCubit _registerCubit;

  @override
  void initState() {
    _registerCubit = getIt.get<RegisterCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerCubit,
      child: const RegisterScreen(),
    );
  }
}
