import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/presentation/journey/auth/login/cubit/login_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../login/widget/login_with_item.dart';

class AuthScaffoldConstants {
  static double sizeLogo = 100.w;
  static double distanceTextToField = 28.h;
  static double distanceButtonToField = 40.h;
  static double horizontalOr = 10.w;
  static double horizontal = 16.88.w;
  static double sizeIcon = 28.w;

  static String or = translate('or');
  static List<ItemLoginWithModel> listIconsLogin(BuildContext context) => [
        ItemLoginWithModel(
          icon: Assets.icons.icGoogle.svg(
            width: sizeIcon,
            height: sizeIcon,
          ),
          onPressed: () {
            context.read<LoginCubit>().loginWithOther(LoginType.google);
          },
        ),
        // ItemLoginWithModel(
        //   icon: Assets.icons.password.svg(
        //     width: sizeIcon,
        //     height: sizeIcon,
        //   ),
        //   onPressed: () {
        //     context.read<LoginCubit>().checkLoginPassword();
        //   },
        // ),
        ItemLoginWithModel(
          icon: Assets.icons.icFacebook.svg(
            width: sizeIcon,
            height: sizeIcon,
          ),
          onPressed: () {
            context.read<LoginCubit>().loginWithOther(LoginType.facebook);
          },
        ),
      ];
}
