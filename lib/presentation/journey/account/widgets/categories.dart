// ignore_for_file: invalid_use_of_protected_member

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/journey/account/account_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routers/app_router.dart';
import '../../../themes/themes.dart';
import '../cubit/account_cubit.dart';
import 'babs_component_settings_group.dart';
import 'babs_component_settings_item.dart';
import 'change_language_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsGroup(
      items: [
        SettingsItem(
          icons: Assets.icons.help.path,
          title: AccountConstants.authentications.tr,
          onTap: () {
            context.pushRoute(const AuthSettingsRoute());
          },
        ),
        SettingsItem(
            icons: 'assets/icons/language.png',
            title: 'Language'.tr,
            onTap: () {
              showBottomSheet(
                context: context,
                child: const ChangeLanguegeWidget(),
              );
            }),
        SettingsItem(
          icons: Assets.icons.bottomBarTransactions.path,
          title: 'Rate me',
          onTap: () {},
        ),
        SettingsItem(
          icons: 'assets/icons/aboutme.png',
          title: 'About me',
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
          icons: 'assets/icons/logout.png',
          title: 'Logout'.tr,
        ),
      ],
    );
  }
}

Future<dynamic> showBottomSheet(
    {required Widget child, required BuildContext context}) async {
  return await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    barrierColor: Colors.black.withOpacity(0.25),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.r),
        topRight: Radius.circular(8.r),
      ),
    ),
    backgroundColor: AppColor.iron,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "change_language".tr,
              style: ThemeText.body1,
            ),
            SizedBox(
              height: 10.h,
            ),
            child,
          ],
        ),
      );
    },
  );
}
