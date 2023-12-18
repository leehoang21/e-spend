import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';

import 'cubit/profile_cubit.dart';
import 'profile_screen.dart';

@RoutePage()
class ProfileScreenProvider extends StatefulWidget {
  const ProfileScreenProvider({super.key});
  @override
  State<ProfileScreenProvider> createState() => _ProfileScreenProviderState();
}

class _ProfileScreenProviderState extends State<ProfileScreenProvider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ProfileCubit>(),
      child: const ProfileScreen(),
    );
  }
}
