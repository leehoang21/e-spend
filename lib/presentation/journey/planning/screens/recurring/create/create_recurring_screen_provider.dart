import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import '../../../../../../data/models/recurring_model.dart';
import 'bloc/create/create_recurring_bloc.dart';
import 'create_recurring_screen.dart';

@RoutePage()
class CreateRecurringScreenProvider extends StatefulWidget {
  const CreateRecurringScreenProvider({
    super.key,
    this.data,
  });
  final RecurringModel? data;

  @override
  State<CreateRecurringScreenProvider> createState() =>
      _CreateRecurringScreenProviderState();
}

class _CreateRecurringScreenProviderState
    extends State<CreateRecurringScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<CreateRecurringBloc>(),
        ),
      ],
      child: CreateRecurringScreen(
        data: widget.data,
      ),
    );
  }
}
