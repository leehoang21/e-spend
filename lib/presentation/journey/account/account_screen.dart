import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'account_constants.dart';
import 'widgets/categories.dart';
import 'widgets/information.dart';
import 'widgets/version.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key ?? AccountConstants.key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScaffoldWidget(
        body: ListView(
          children: [
            Text(
              "My Page".tr,
              style: const TextStyle(fontSize: 23, color: Colors.black),
            ),
            SizedBox(
              height: AppDimens.height_24,
            ),
            const Information(),
            const CategoriesWidget(),
            version(),
          ],
        ),
      );
    });
  }
}
