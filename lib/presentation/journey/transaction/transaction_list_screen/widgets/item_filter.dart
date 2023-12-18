import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widgets/button_widget/text_button_widget.dart';

class ItemFilter extends StatelessWidget {
  const ItemFilter({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButtonWidget2(
      onPressed: onPressed,
      title: title,
      icon: Container(
        padding: EdgeInsets.all(2.r),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: LayoutConstants.iconSize,
        ),
      ),
    );
  }
}
