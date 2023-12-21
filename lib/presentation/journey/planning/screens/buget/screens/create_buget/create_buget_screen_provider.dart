import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';

import '../../../../../../../data/models/buget_model.dart';
import 'create_buget_screen.dart';
import 'cubit/create_buget_cubit.dart';

@RoutePage()
class CreateBugetScreenProvider extends StatefulWidget {
  const CreateBugetScreenProvider({super.key, this.data});
  final BugetModel? data;

  @override
  State<CreateBugetScreenProvider> createState() =>
      _CreateBugetScreenProviderState();
}

class _CreateBugetScreenProviderState extends State<CreateBugetScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CreateBugetCubit>(),
      child: CreateBugetScreen(
        data: widget.data,
      ),
    );
  }
}
