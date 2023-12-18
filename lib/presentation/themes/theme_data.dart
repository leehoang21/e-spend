import 'package:flutter/material.dart';

import '../../common/constants/app_dimens.dart';
import '../../common/constants/layout_constants.dart';
import 'theme_icon.dart';
import 'themes.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'QS',
    primaryColor: AppColor.primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutConstants.roundedRadius),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColor.taupeGray,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: AppColor.backgroundColor,
    iconTheme: ThemeIcon.getDefaultIconTheme(),
    appBarTheme: const AppBarTheme(color: AppColor.ebonyClay, elevation: 0.0),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColor.ebonyClay),
      unselectedIconTheme: IconThemeData(color: AppColor.grey),
      unselectedLabelStyle: TextStyle(color: AppColor.grey),
      selectedLabelStyle: TextStyle(color: AppColor.ebonyClay),
      unselectedItemColor: AppColor.grey,
      selectedItemColor: AppColor.ebonyClay,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.ebonyClay,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle:
          TextStyle(fontSize: AppDimens.space_16, color: AppColor.ebonyClay),
      unselectedLabelStyle: TextStyle(
          fontSize: AppDimens.space_16, color: AppColor.secondaryColor),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColor.primaryColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryColor;
        }
        return null;
      }),
    ),
  );
}
