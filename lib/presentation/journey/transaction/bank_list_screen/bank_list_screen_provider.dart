import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/transaction/bank_list_screen/bank_list_screen.dart';

import 'bloc/bank_search_cubit.dart';

@RoutePage()
class BankListScreenProvider extends StatefulWidget {
  const BankListScreenProvider({super.key});

  @override
  State<BankListScreenProvider> createState() => _BankListScreenProviderState();
}

class _BankListScreenProviderState extends State<BankListScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<BankSearchCubit>(),
      child: BankListScreen(),
    );
  }
}
