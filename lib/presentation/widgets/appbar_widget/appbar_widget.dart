// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../presentation/themes/themes.dart';
import 'appbar_constants.dart';

class AppBarButton extends StatelessWidget {
  final Widget? child;

  final String? iconSource;
  final Color? iconColor;
  final Function()? onTap;
  final double? width;
  final double? height;

  const AppBarButton({
    Key? key,
    this.child,
    this.iconSource,
    this.onTap,
    this.width,
    this.height,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppbarConstants.buttonSize,
      width: AppbarConstants.buttonSize,
      child: InkWell(
        onTap: onTap,
        child: child ??
            Center(
              child: SvgPicture.asset(
                iconSource!,
                color: iconColor ?? Colors.white,
                width: width ?? AppbarConstants.buttonIconSize,
                height: height ?? AppbarConstants.buttonIconSize,
              ),
            ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final Widget? leading;
  final Widget? action;
  final String? title;
  final Widget? centerWidget;
  final TextStyle? titleStyle;
  final Color? color;

  const AppBarWidget({
    Key? key,
    this.leading,
    this.title,
    this.action,
    this.centerWidget,
    this.titleStyle,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      color: color ?? Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: top,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _LeadingWidget(
                leading: leading,
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: centerWidget ??
                    Text(
                      title ?? '',
                      style: titleStyle ??
                          ThemeText.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.white),
                      textAlign: TextAlign.center,
                    ),
              ),
              SizedBox(
                width: 20.w,
              ),
              action != null
                  ? action!
                  : SizedBox(
                      width: AppbarConstants.buttonSize,
                      height: AppbarConstants.buttonSize,
                    ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => AppbarConstants.appbarSize;
}

class _LeadingWidget extends StatelessWidget {
  const _LeadingWidget({
    Key? key,
    this.leading,
  }) : super(key: key);
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    if (leading != null) {
      return leading!;
    }
    return !context.router.canPop()
        ? SizedBox(
            width: AppbarConstants.buttonSize,
            height: AppbarConstants.buttonSize,
          )
        : InkWell(
            onTap: () {
              context.popRoute();
            },
            child: SizedBox(
              width: AppbarConstants.buttonSize,
              height: AppbarConstants.buttonSize,
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.white,
              ),
            ),
          );
  }
}
