import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/presentation/journey/auth/login/cubit/login_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'widget/login_with_item.dart';

class LoginConstants {
  static double topHeightLogo = 86.h;
  static double sizeLogo = 100.w;
  static double horizontalScreen = 16.88.w;
  static double topColumn = 71.h;
  static double distanceTextToField = 28.h;
  static double distanceButtonToField = 40.h;
  static double horizontalOr = 10.w;
  static double rCircle = 60.w;
  static double sizeIcon = 28.w;
  static String login = translate('login');
  static String yourPhone = translate('your_phone_number');
  static String signIn = translate('sign_in');
  static String or = translate('or');
  static String notHaveAccount = translate('notHaveAccount');
  static String register = translate('register');
  static String yourPassword = translate('your_password');
  static List<ItemLoginWithModel> listIconsLogin(BuildContext context) => [
        ItemLoginWithModel(
          icon: Assets.icons.icGoogle.svg(
            width: LoginConstants.sizeIcon,
            height: LoginConstants.sizeIcon,
          ),
          onPressed: () {
            context.read<LoginCubit>().loginWithSocial(LoginType.google);
          },
        ),
        ItemLoginWithModel(
          icon: Assets.icons.password.svg(
            width: LoginConstants.sizeIcon,
            height: LoginConstants.sizeIcon,
          ),
          onPressed: () {
            context.read<LoginCubit>().checkLoginPassword();
          },
        ),
        ItemLoginWithModel(
          icon: Assets.icons.icFacebook.svg(
            width: LoginConstants.sizeIcon,
            height: LoginConstants.sizeIcon,
          ),
          onPressed: () {
            context.read<LoginCubit>().loginWithSocial(LoginType.facebook);
          },
        ),
      ];
}
