import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/presentation/journey/wallet/screens/wallet_list_screen/wallet_list_screen.dart';

import '../../../../../common/di/di.dart';
import 'bloc/wallet_list_cubit.dart';

@RoutePage()
class WalletListScreenProvider extends StatefulWidget {
  const WalletListScreenProvider({super.key});

  @override
  State<WalletListScreenProvider> createState() =>
      _WalletListScreenProviderState();
}

class _WalletListScreenProviderState extends State<WalletListScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<WalletListCubit>(),
      child: WalletListScreen(),
    );
  }
}
