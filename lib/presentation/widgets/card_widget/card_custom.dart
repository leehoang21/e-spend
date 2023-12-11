import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/layout_constants.dart';
import '../../themes/themes.dart';

class CardCustom extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  const CardCustom({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(LayoutConstants.borderSmall),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8,
              color: AppColor.black.withOpacity(0.1),
            )
          ]),
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
