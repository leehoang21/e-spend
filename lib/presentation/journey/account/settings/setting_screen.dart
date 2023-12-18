import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/journey/account/widgets/change_language_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'setting_contant.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: SettingsConstants.title.tr,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: AppDimens.height_24,
          ),
          const ChangeLanguegeWidget(),
        ],
      ),
    );
  }
}
