import 'package:flutter/material.dart';

import '../../../common/constants/layout_constants.dart';
import '../../themes/themes.dart';

class ScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appbar;
  final Widget body;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;
  final Color safeColor;

  const ScaffoldWidget({
    Key? key,
    required this.body,
    this.appbar,
    this.backgroundColor = AppColor.white,
    this.bottomNavigationBar,
    this.safeColor = AppColor.ebonyClay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: LayoutConstants.paddingTop24),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstants.paddingHorizontalApp)
                .copyWith(bottom: LayoutConstants.paddingVerticalApp),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: body,
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
