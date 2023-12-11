import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';

import '../../../common/di/di.dart';
import 'account_constants.dart';
import 'cubit/account_cubit.dart';
import 'widgets/categories.dart';
import 'widgets/information.dart';
import 'widgets/version.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key ?? AccountConstants.key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AccountCubit>(),
      child: Builder(builder: (context) {
        return ScaffoldWidget(
          appbar: AppBar(
            title: Text(
              "My Page".tr,
              style: const TextStyle(fontSize: 23, color: Colors.black),
            ),
          ),
          body: ListView(
            children: [
              const Information(),
              const CategoriesWidget(),
              version(),
            ],
          ),
        );
      }),
    );
  }
}
