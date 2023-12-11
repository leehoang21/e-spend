import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/journey/account/auth_setting/cubit/auth_settings_cubit.dart';
import 'package:flutter_e_spend/presentation/journey/account/widgets/babs_component_settings_item.dart';
import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../common/assets/assets.gen.dart';
import '../widgets/babs_component_settings_group.dart';
import 'auth_setting_contant.dart';

class AuthSettingsScreen extends StatelessWidget {
  const AuthSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: AuthSettingsConstants.title.tr,
      ),
      body: ValueListenableBuilder(
        valueListenable:
            context.read<AuthSettingsCubit>().hiveConfig.appBox.listenable(),
        builder: (context, box, widget) {
          final user = context.read<AuthSettingsCubit>().hiveConfig.user;
          final isLocalAuth =
              context.read<AuthSettingsCubit>().hiveConfig.localAuth;
          return SingleChildScrollView(
            child: SettingsGroup(
              items: [
                SettingsItem(
                  icons: user?.googleLink?.avatar ?? '',
                  iconDefault: Assets.icons.icGoogle.path,
                  title: AuthSettingsConstants.google.tr,
                  subtitle: user?.googleLink != null
                      ? user?.googleLink?.email ?? ' '
                      : AuthSettingsConstants.notLinked.tr,
                  onTap: () {
                    context
                        .read<AuthSettingsCubit>()
                        .linkSocial(loginType: LoginType.google);
                  },
                ),
                SettingsItem(
                  icons: user?.facebookLink?.avatar ?? '',
                  iconDefault: Assets.icons.icFacebook.path,
                  title: AuthSettingsConstants.facebook.tr,
                  subtitle: user?.facebookLink != null
                      ? user?.facebookLink?.email ?? ' '
                      : AuthSettingsConstants.notLinked.tr,
                  onTap: () {
                    context
                        .read<AuthSettingsCubit>()
                        .linkSocial(loginType: LoginType.facebook);
                  },
                ),
                SettingsItem(
                  icons: Assets.icons.icMoney.path,
                  iconDefault: Assets.icons.icApple.path,
                  title: AuthSettingsConstants.twoStep.tr,
                  subtitle: isLocalAuth
                      ? AuthSettingsConstants.on.tr
                      : AuthSettingsConstants.off.tr,
                  onTap: () {
                    context.read<AuthSettingsCubit>().localAuth();
                  },
                ),
                // SettingsItem(
                //   icons: Assets.icons.icMoney.path,
                //   iconDefault: Assets.icons.icApple.path,
                //   title: AuthSettingsConstants.verifyEmail.tr,
                //   subtitle: '',
                //   onTap: () {},
                // ),
                SettingsItem(
                  icons: Assets.icons.icApple.path,
                  iconDefault: Assets.icons.icApple.path,
                  title: AuthSettingsConstants.loginWithPassword.tr,
                  subtitle: '',
                  onTap: () {
                    context.read<AuthSettingsCubit>().loginWithPassword();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
