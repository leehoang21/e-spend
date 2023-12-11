import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/presentation/journey/account/auth_setting/cubit/auth_settings_cubit.dart';

import '../../../../common/di/di.dart';
import 'auth_setting_screen.dart';

@RoutePage()
class AuthSettingsScreenProvider extends StatelessWidget {
  const AuthSettingsScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<AuthSettingsCubit>(),
        child: const AuthSettingsScreen());
  }
}
