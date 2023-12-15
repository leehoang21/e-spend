import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/app_dimens.dart';
import '../../../common/constants/layout_constants.dart';

class ScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appbar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const ScaffoldWidget({
    Key? key,
    required this.body,
    this.appbar,
    this.bottomNavigationBar,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      appBar: appbar,
      resizeToAvoidBottomInset: false,
      backgroundColor: appbar == null
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).appBarTheme.backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: appbar != null
            ? SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Theme.of(context).appBarTheme.backgroundColor)
            : SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Theme.of(context).scaffoldBackgroundColor),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: AppDimens.height_20),
            child: Container(
              padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstants.paddingHorizontalApp)
                  .copyWith(bottom: LayoutConstants.paddingVerticalApp),
              decoration: BoxDecoration(
                color: appbar == null
                    ? null
                    : Theme.of(context).scaffoldBackgroundColor,
                borderRadius: appbar == null
                    ? BorderRadius.zero
                    : BorderRadius.only(
                        topLeft: Radius.circular(AppDimens.radius_20),
                        topRight: Radius.circular(AppDimens.radius_20),
                      ),
              ),
              child: body,
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
