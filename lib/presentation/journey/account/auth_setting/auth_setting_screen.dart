import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_e_spend/presentation/journey/account/auth_setting/cubit/auth_settings_cubit.dart';
import 'package:flutter_e_spend/presentation/journey/account/auth_setting/widgets/input_password_dialog.dart';
import 'package:flutter_e_spend/presentation/journey/account/widgets/babs_component_settings_item.dart';
import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../common/assets/assets.gen.dart';
import 'auth_setting_contant.dart';

class AuthSettingsScreen extends StatelessWidget {
  const AuthSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: AuthSettingsConstants.title.tr,
      ),
      body: ValueListenableBuilder<Box>(
        valueListenable:
            context.read<AuthSettingsCubit>().hiveConfig.appBox.listenable(),
        builder: (context, box, widget) {
          final user =
              context.read<AuthSettingsCubit>().hiveConfig.user ?? UserModel();
          final bool isLocalAuth =
              box.get(DefaultEnvironment.localAuth) == user.uId;
          return ListView(
            children: [
              // SettingsItem(
              //   icons: user.googleLink?.avatar ?? '',
              //   iconDefault: Assets.icons.icGoogle.path,
              //   title: AuthSettingsConstants.google.tr,
              //   subtitle: user.googleLink != null
              //       ? (user.googleLink?.email ??
              //           user.googleLink?.userName ??
              //           '')
              //       : AuthSettingsConstants.notLinked.tr,
              //   onTap: () {
              //     context
              //         .read<AuthSettingsCubit>()
              //         .linkSocial(loginType: LoginType.google);
              //   },
              // ),
              // SettingsItem(
              //   icons: user.facebookLink?.avatar ?? '',
              //   iconDefault: Assets.icons.icFacebook.path,
              //   title: AuthSettingsConstants.facebook.tr,
              //   subtitle: user.facebookLink != null
              //       ? (user.facebookLink?.email ??
              //           user.facebookLink?.userName ??
              //           '')
              //       : AuthSettingsConstants.notLinked.tr,
              //   onTap: () {
              //     context
              //         .read<AuthSettingsCubit>()
              //         .linkSocial(loginType: LoginType.facebook);
              //   },
              // ),
              if (context.watch<AuthSettingsCubit>().state.isLocalAuth)
                SettingsItem(
                  icons: Assets.icons.icBiometrics.path,
                  iconDefault: Assets.icons.icBiometrics.path,
                  title: AuthSettingsConstants.biometrics.tr,
                  subtitle: isLocalAuth
                      ? AuthSettingsConstants.on.tr
                      : AuthSettingsConstants.off.tr,
                  onTap: () {
                    context.showDialog(
                      child: InputPasswordDialog(
                        onConfirm: (password) {
                          context
                              .read<AuthSettingsCubit>()
                              .authBiometric(password);
                        },
                      ),
                    );
                  },
                ),
              // SettingsItem(
              //   icons: Assets.icons.password.path,
              //   iconDefault: Assets.icons.password.path,
              //   title: AuthSettingsConstants.loginWithPassword.tr,
              //   subtitle: user.isPassword == true
              //       ? AuthSettingsConstants.on.tr
              //       : AuthSettingsConstants.off.tr,
              //   onTap: () {},
              // ),
            ],
          );
        },
      ),
    );
  }
}
