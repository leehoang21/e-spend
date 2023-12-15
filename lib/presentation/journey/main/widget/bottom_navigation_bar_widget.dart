import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_e_spend/presentation/widgets/image_app_widget/image_app.dart';
import 'bottom_navigation_bar_constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
    required this.iconsData,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  final void Function(int) onTap;
  final List<Map<String, dynamic>> iconsData;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: iconsData.asMap().entries.map((entry) {
        return BottomNavigationBarItem(
          icon: Padding(
            padding: BottomNavigationBarConstants.itemPadding,
            child: AppImageWidget(
              path: entry.value["iconPath"],
              width: BottomNavigationBarConstants.iconWidth,
              height: BottomNavigationBarConstants.iconWidth,
              color: currentIndex == entry.key
                  ? AppColor.ebonyClay
                  : AppColor.grey,
            ),
          ),
          label: (entry.value["label"] as String).tr,
        );
      }).toList(),
    );
  }
}
