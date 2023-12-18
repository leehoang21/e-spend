import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/data/models/wallet_model.dart';
import 'bloc/detail_wallet_cubit.dart';
import 'detail_wallet_screen.dart';

@RoutePage()
class DetailWalletScreenProvider extends StatefulWidget {
  const DetailWalletScreenProvider({super.key, required this.wallet});
  final WalletModel wallet;

  @override
  State<DetailWalletScreenProvider> createState() =>
      _DetailWalletScreenProviderState();
}

class _DetailWalletScreenProviderState
    extends State<DetailWalletScreenProvider> {
  late DetailWalletCubit _createWalletCubit;
  @override
  void initState() {
    _createWalletCubit = getIt.get<DetailWalletCubit>();
    _createWalletCubit.init(widget.wallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createWalletCubit,
      child: const DetailWalletScreen(),
    );
  }
}
