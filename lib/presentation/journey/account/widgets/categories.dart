// ignore_for_file: invalid_use_of_protected_member

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/journey/account/account_constants.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import '../../../routers/app_router.dart';
import '../cubit/account_cubit.dart';
import 'babs_component_settings_group.dart';
import 'babs_component_settings_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsGroup(
      items: [
        SettingsItem(
          icons: Assets.images.bottomBarTransactions.path,
          title: AccountConstants.transactions.tr,
          onTap: () {
            context.pushRoute(const TransactionListRoute());
          },
        ),
        SettingsItem(
            icons: Assets.icons.icWallet.svg(
              height: AppDimens.space_30,
              width: AppDimens.space_30,
              colorFilter: const ColorFilter.mode(
                AppColor.blue,
                BlendMode.srcIn,
              ),
            ),
            title: AccountConstants.wallets.tr,
            onTap: () {
              context.pushRoute(const WalletListRoute());
            }),
        SettingsItem(
          icons: Assets.icons.logIn.path,
          title: AccountConstants.loginMethods.tr,
          onTap: () {
            context.pushRoute(const AuthSettingsRoute());
          },
        ),
        SettingsItem(
            icons: Icons.settings,
            title: AccountConstants.settings.tr,
            onTap: () {
              context.pushRoute(const SettingsRoute());
            }),
        SettingsItem(
          icons: Assets.icons.rateme.path,
          title: AccountConstants.rateMe.tr,
          onTap: () {},
        ),
        SettingsItem(
          icons: Assets.icons.aboutme.path,
          title: AccountConstants.aboutMe.tr,
          onTap: () {},
        ),
        SettingsItem(
          onTap: () {
            context.read<AccountCubit>().signOut();
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          },
          icons: Assets.icons.logout.path,
          title: AccountConstants.logout.tr,
        ),
      ],
    );
  }
}
