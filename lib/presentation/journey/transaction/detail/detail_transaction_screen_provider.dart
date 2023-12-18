import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/di/di.dart';
import '../../../../data/models/transaction_model.dart';
import 'bloc/detail_transaction_bloc.dart';
import 'detail_transaction_screen.dart';

class DetailTransactionScreenProvider extends StatefulWidget {
  final TransactionModel data;
  const DetailTransactionScreenProvider({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  State<DetailTransactionScreenProvider> createState() =>
      _DetailTransactionScreenProviderState();
}

class _DetailTransactionScreenProviderState
    extends State<DetailTransactionScreenProvider> {
  late final DetailTransactionBloc bloc;

  @override
  void initState() {
    bloc = getIt.get<DetailTransactionBloc>();
    bloc.init(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: const DetailTransactionScreen(),
    );
  }
}
