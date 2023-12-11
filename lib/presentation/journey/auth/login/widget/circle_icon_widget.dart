import 'package:flutter/material.dart';
import '../../../../themes/themes.dart';
import '../login_constants.dart';

class CircleIconWidget extends StatelessWidget {
  const CircleIconWidget({Key? key, required this.icon}) : super(key: key);
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: LoginConstants.rCircle,
      height: LoginConstants.rCircle,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: AppColor.iron),
      ),
      child: icon,
    );
  }
}
