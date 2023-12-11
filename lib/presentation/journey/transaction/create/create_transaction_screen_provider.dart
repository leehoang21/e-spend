import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/transaction/create/bloc/add_photo/add_photo_bloc.dart';
import 'package:flutter_e_spend/presentation/journey/transaction/create/create_transaction_screen.dart';

import 'bloc/create/create_transaction_bloc.dart';

@RoutePage()
class CreateTransactionScreenProvider extends StatefulWidget {
  const CreateTransactionScreenProvider({super.key});

  @override
  State<CreateTransactionScreenProvider> createState() =>
      _CreateTransactionScreenProviderState();
}

class _CreateTransactionScreenProviderState
    extends State<CreateTransactionScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<CreateTransactionBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<AddPhotoBloc>(),
        ),
      ],
      child: const CreateTransactionScreen(),
    );
  }
}
