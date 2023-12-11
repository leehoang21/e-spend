import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/widgets/image_app_widget/image_app.dart';
import '../../../themes/themes.dart';
import 'bottom_navigation_bar_constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
    required this.iconsData,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int) onTap;
  final List<Map<String, dynamic>> iconsData;

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
              // ignore: deprecated_member_use
              color: entry.key == currentIndex
                  ? AppColor.ebonyClay
                  : AppColor.grey,
              height: BottomNavigationBarConstants.iconHeight,
            ),
          ),
          label: (entry.value["label"] as String).tr,
        );
      }).toList(),
      selectedFontSize: BottomNavigationBarConstants.labelFontSize,
      unselectedFontSize: BottomNavigationBarConstants.labelFontSize,
    );
  }
}
