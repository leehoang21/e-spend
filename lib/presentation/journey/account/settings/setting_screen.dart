import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/journey/account/widgets/babs_component_settings_item.dart';
import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import '../widgets/babs_component_settings_group.dart';
import 'setting_contant.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: SettingsConstants.title.tr,
      ),
      body: SingleChildScrollView(
        child: SettingsGroup(
          items: [
            SettingsItem(
                icons: Assets.icons.language.path,
                title: SettingsConstants.lang.tr,
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
