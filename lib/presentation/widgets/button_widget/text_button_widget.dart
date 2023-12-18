import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/layout_constants.dart';
import '../../../../presentation/themes/themes.dart';

enum ButtonState { active, inactive }

class TextButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final String title;
  final double? width;
  final double? height;
  final ButtonState? buttonState;

  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.buttonState = ButtonState.active,
    this.buttonColor,
    this.titleColor,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            buttonState == ButtonState.active
                ? buttonColor ?? AppColor.black
                : AppColor.iron),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, LayoutConstants.buttonSize),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(width ?? MediaQuery.of(context).size.width,
              height ?? LayoutConstants.buttonSize),
        ),
      ),
      child: Text(
        title,
        style: ThemeText.caption.copyWith(
            fontWeight: FontWeight.bold, color: titleColor ?? AppColor.white),
      ),
    );
  }
}

class TextButtonWidget2 extends StatelessWidget {
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final String title;
  final double? width;
  final double? height;
  final ButtonState? buttonState;
  final Widget? icon;

  const TextButtonWidget2({
    Key? key,
    required this.onPressed,
    required this.title,
    this.buttonState = ButtonState.active,
    this.buttonColor,
    this.titleColor,
    this.height,
    this.width,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            buttonState == ButtonState.active
                ? buttonColor ?? AppColor.black
                : AppColor.iron),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1000),
            ),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: ThemeText.caption.copyWith(
                fontWeight: FontWeight.bold,
                color: titleColor ?? AppColor.white),
          ),
          SizedBox(
            width: AppDimens.width_8,
          ),
          icon ?? const SizedBox(),
        ],
      ),
    );
  }
}
