import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';

import 'bloc/create_wallet_cubit.dart';
import 'create_wallet_screen.dart';

@RoutePage()
class CreateWalletScreenProvider extends StatefulWidget {
  const CreateWalletScreenProvider({super.key});

  @override
  State<CreateWalletScreenProvider> createState() =>
      _CreateWalletScreenProviderState();
}

class _CreateWalletScreenProviderState
    extends State<CreateWalletScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CreateWalletCubit>(),
      child: const CreateWalletScreen(),
    );
  }
}
