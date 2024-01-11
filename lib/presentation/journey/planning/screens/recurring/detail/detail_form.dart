import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/recurring_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/constants/app_dimens.dart';
import '../../../../../../../common/utils/app_utils.dart';
import '../../../../../themes/themes.dart';
import '../../../../../widgets/image_app_widget/image_app.dart';

class ItemDetailRecurringWidget extends StatelessWidget {
  const ItemDetailRecurringWidget({
    super.key,
    required this.image,
    required this.title,
    this.titleColor,
    this.subTitle,
  });
  final String image;
  final String title;
  final Color? titleColor;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (subTitle != null)
            Text(
              subTitle!,
              style: ThemeText.caption
                  .copyWith(color: titleColor, fontSize: AppDimens.space_12),
            ),
          Row(
            children: [
              AppImageWidget(
                path: image,
                width: 26.sp,
                height: 26.sp,
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                title,
                style: ThemeText.caption.copyWith(
                  color: titleColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailRecurringForm extends StatefulWidget {
  const DetailRecurringForm({
    Key? key,
    required this.model,
  }) : super(key: key);
  final RecurringModel model;

  @override
  State<DetailRecurringForm> createState() => _DetailRecurringFormState();
}

class _DetailRecurringFormState extends State<DetailRecurringForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemDetailRecurringWidget(
            image: Assets.images.icCoins.path,
            title: (widget.model.defaultAmount ?? 0).getTextAmount),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailRecurringWidget(
            image: Assets.images.icWallet.path,
            title: (widget.model.wallet?.walletName ?? '').toString()),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailRecurringWidget(
            image: isNullEmpty(widget.model.category?.toString().tr)
                ? Assets.images.category.path
                : "${StringConstants.imagePath}${widget.model.category?.title.toLowerCase()}.png",
            title: (widget.model.category?.toString().tr).toString()),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailRecurringWidget(
            subTitle: 'Thời gian bắt đầu',
            image: Assets.images.calendar.path,
            title: (widget.model.createAt ?? DateTime.now()).formatDMY),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailRecurringWidget(
            subTitle: 'Lặp lại',
            image: Assets.icons.repeat.path,
            title:
                'Lặp lại sau mỗi ${widget.model.createAt ?? DateTime.now()} ${widget.model.repeat?.type.toString().tr}'),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailRecurringWidget(
            image: Assets.images.note.path, title: 'note'),
        SizedBox(
          height: AppDimens.height_8,
        ),
      ],
    );
  }
}
