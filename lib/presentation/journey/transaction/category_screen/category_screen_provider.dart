import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/transaction/category_screen/category_screen.dart';

import '../../../../data/models/category_model.dart';
import 'bloc/category_select_cubit.dart';

@RoutePage()
class CategoryScreenProvider extends StatefulWidget {
  const CategoryScreenProvider({super.key, required this.category});
  final CategoryModel? category;

  @override
  State<CategoryScreenProvider> createState() => _CategoryScreenProviderState();
}

class _CategoryScreenProviderState extends State<CategoryScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CategorySelectCubit>(),
      child: CategoryScreen(
        category: widget.category,
      ),
    );
  }
}
