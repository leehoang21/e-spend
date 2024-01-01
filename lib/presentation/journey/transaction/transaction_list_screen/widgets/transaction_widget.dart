import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';

import '../../../../../common/enums/category.dart';
import '../../../../../data/models/transaction_model.dart';
import '../../../../themes/themes.dart';
import 'item_transaction_widget.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.data,
  });
  final MapEntry<String, List<TransactionModel>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.key,
              style: ThemeText.caption,
            ),
            Text(
              data.value.fold(0.0, (previousValue, element) {
                if (element.category.category.categoryType ==
                        CategoryType.expense ||
                    element.category.category.categoryType ==
                        CategoryType.loan) {
                  return previousValue - element.amount;
                }
                return previousValue + element.amount;
              }).getTextCompactCurrencyAmount,
              style: ThemeText.caption.copyWith(
                color: AppColor.grey,
              ),
            ),
          ],
        ),
        for (var item in data.value) ItemTransactionWidget(item: item),
      ],
    );
  }
}
