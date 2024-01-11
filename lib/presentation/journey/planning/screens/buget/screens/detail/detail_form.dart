import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/buget_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/constants/app_dimens.dart';
import '../../../../../../../common/utils/app_utils.dart';
import '../../../../../../themes/theme_text.dart';
import '../../../../../../widgets/image_app_widget/image_app.dart';

class ItemDetailBugetWidget extends StatelessWidget {
  const ItemDetailBugetWidget({
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

class DetailBugetForm extends StatefulWidget {
  const DetailBugetForm({
    Key? key,
    required this.bugetModel,
  }) : super(key: key);
  final BugetModel bugetModel;

  @override
  State<DetailBugetForm> createState() => _DetailBugetFormState();
}

class _DetailBugetFormState extends State<DetailBugetForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemDetailBugetWidget(
            image: Assets.images.icCoins.path,
            title: (widget.bugetModel.amount ?? 0).getTextAmount),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailBugetWidget(
            image: Assets.images.icWallet.path,
            title: (widget.bugetModel.wallet?.walletName ?? '').toString()),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailBugetWidget(
            image: isNullEmpty(
                    widget.bugetModel.category?.category.toString().tr)
                ? Assets.images.category.path
                : "${StringConstants.imagePath}${widget.bugetModel.category?.category.title.toLowerCase()}.png",
            title: (widget.bugetModel.category?.category.toString().tr)
                .toString()),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailBugetWidget(
            subTitle: 'Thời gian bắt đầu',
            image: Assets.images.calendar.path,
            title: (widget.bugetModel.createAt ?? DateTime.now()).formatDMY),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailBugetWidget(
            subTitle: 'Lặp lại',
            image: Assets.icons.repeat.path,
            title: 'Lặp lại sau mỗi 3 ngày'),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailBugetWidget(image: Assets.images.note.path, title: 'note'),
        SizedBox(
          height: AppDimens.height_8,
        ),
      ],
    );
  }
}
