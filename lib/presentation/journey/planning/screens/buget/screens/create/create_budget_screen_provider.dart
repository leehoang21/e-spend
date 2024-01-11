import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import '../../../../../../../data/models/buget_model.dart';
import 'bloc/create/create_budget_bloc.dart';
import 'create_budget_screen.dart';

@RoutePage()
class CreateBugetScreenProvider extends StatefulWidget {
  const CreateBugetScreenProvider({
    super.key,
    this.data,
  });
  final BugetModel? data;

  @override
  State<CreateBugetScreenProvider> createState() =>
      _CreateBugetScreenProviderState();
}

class _CreateBugetScreenProviderState extends State<CreateBugetScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<CreateBugetBloc>(),
        ),
      ],
      child: CreateBugetScreen(
        data: widget.data,
      ),
    );
  }
}
