import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/di/di.dart';
import 'bloc/recurring_list_cubit.dart';
import 'recurring_list_screen.dart';

@RoutePage()
class RecurringListScreenProvider extends StatefulWidget {
  const RecurringListScreenProvider({super.key});

  @override
  State<RecurringListScreenProvider> createState() =>
      _RecurringListScreenProviderState();
}

class _RecurringListScreenProviderState
    extends State<RecurringListScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<RecurringListCubit>(),
      child: RecurringListScreen(),
    );
  }
}
