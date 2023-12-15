import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/widgets/card_widget/card_custom.dart';

import '../../../themes/themes.dart';

class DebtsAndLoanWidget extends StatelessWidget {
  const DebtsAndLoanWidget({
    super.key,
    required this.data,
    required this.type,
  });
  final num data;
  final CategoryType type;

  @override
  Widget build(BuildContext context) {
    return CardCustom(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              type == CategoryType.loan
                  ? Assets.images.icCash.image(
                      height: AppDimens.width_20,
                      width: AppDimens.width_20,
                    )
                  : Assets.images.icDebt.image(
                      height: AppDimens.width_20,
                      width: AppDimens.width_20,
                    ),
              Text(
                type.title.tr,
                style: ThemeText.caption,
              ),
            ],
          ),
          Text(
            data.getTextAmount,
            style: ThemeText.body1.copyWith(
              color: type == CategoryType.loan ? AppColor.red : AppColor.blue,
            ),
          ),
        ],
      ),
    );
  }
}
