import 'package:flutter/material.dart';
import 'circle_icon_widget.dart';

class ItemLoginWithModel {
  final Function()? onPressed;
  final Widget icon;

  ItemLoginWithModel({
    required this.onPressed,
    required this.icon,
  });
}

class ItemLoginWithWidget extends StatelessWidget {
  const ItemLoginWithWidget({
    super.key,
    required this.data,
  });
  final ItemLoginWithModel data;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: data.onPressed,
      icon: CircleIconWidget(
        icon: data.icon,
      ),
    );
  }
}
