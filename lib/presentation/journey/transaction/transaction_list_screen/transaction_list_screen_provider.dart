import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';

import 'bloc/transaction_list_cubit.dart';
import 'transaction_list_screen.dart';

@RoutePage()
class TransactionListScreenProvider extends StatefulWidget {
  const TransactionListScreenProvider({super.key});

  @override
  State<TransactionListScreenProvider> createState() =>
      _TransactionListScreenProviderState();
}

class _TransactionListScreenProviderState
    extends State<TransactionListScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TransactionListCubit>(),
      child: TransactionListScreen(),
    );
  }
}
