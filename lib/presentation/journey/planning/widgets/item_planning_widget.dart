import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_e_spend/presentation/widgets/image_app_widget/image_app.dart';

import '../../../widgets/card_widget/card_custom.dart';

class ItemPlanningWidget extends StatelessWidget {
  const ItemPlanningWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap});
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimens.height_20),
      child: GestureDetector(
        onTap: onTap,
        child: CardCustom(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImageWidget(
                path: icon,
                width: LayoutConstants.iconMediumSize,
                height: LayoutConstants.iconMediumSize,
              ),
              SizedBox(
                width: AppDimens.width_12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: ThemeText.body2,
                    ),
                    Text(
                      subtitle,
                      style: ThemeText.caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
