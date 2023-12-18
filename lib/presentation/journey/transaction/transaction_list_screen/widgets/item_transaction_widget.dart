import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/string_constants.dart';
import '../../../../../data/models/transaction_model.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/image_app_widget/image_app.dart';

class ItemTransactionWidget extends StatelessWidget {
  const ItemTransactionWidget({
    super.key,
    required this.item,
  });

  final TransactionModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(DetailTransactionRoute(data: item));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 44.sp,
              height: 44.sp,
              child: AppImageWidget(
                  path:
                      "${StringConstants.imagePath}${item.category.category.title.toLowerCase()}.png"),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "transaction_category_screen_${(item.category.category.title).toLowerCase()}"
                      .tr,
                  style: ThemeText.caption,
                ),
                Text(
                  item.note ?? '',
                  style: ThemeText.overline,
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${(item.category.category.categoryType == CategoryType.expense || item.category.category.categoryType == CategoryType.loan) ? '-' : '+'}${item.amount.getTextCompactCurrencyAmount}',
              style: ThemeText.caption.copyWith(
                color: (item.category.category.categoryType ==
                            CategoryType.expense ||
                        item.category.category.categoryType ==
                            CategoryType.loan)
                    ? AppColor.red
                    : AppColor.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
