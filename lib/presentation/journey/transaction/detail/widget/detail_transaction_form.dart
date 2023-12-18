import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_dimens.dart';
import '../../../../../common/utils/app_utils.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/image_app_widget/image_app.dart';
import '../../create/create_transaction_constants.dart';
import '../bloc/detail_transaction_bloc.dart';

class ItemDetailTransactionWidget extends StatelessWidget {
  const ItemDetailTransactionWidget({
    super.key,
    required this.image,
    required this.title,
    this.titleColor,
  });
  final String image;
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 5.h,
      ),
      child: Row(
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
    );
  }
}

class DetailTransactionForm extends StatefulWidget {
  const DetailTransactionForm({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailTransactionForm> createState() => _DetailTransactionFormState();
}

class _DetailTransactionFormState extends State<DetailTransactionForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemDetailTransactionWidget(
            image: Assets.images.icCoin.path,
            title: context
                .watch<DetailTransactionBloc>()
                .state
                .data
                .amount
                .getTextCompactCurrencyAmount),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailTransactionWidget(
            image: Assets.icons.icWallet.path,
            title: (context
                        .watch<DetailTransactionBloc>()
                        .state
                        .data
                        .wallet
                        .walletName ??
                    '')
                .toString()),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailTransactionWidget(
            image: isNullEmpty(context
                    .watch<DetailTransactionBloc>()
                    .state
                    .data
                    .category
                    .category
                    .toString()
                    .tr)
                ? Assets.images.category.path
                : "${StringConstants.imagePath}${context.watch<DetailTransactionBloc>().state.data.category.category.title.toLowerCase()}.png",
            title: (context
                    .watch<DetailTransactionBloc>()
                    .state
                    .data
                    .category
                    .toString()
                    .tr)
                .toString()),
        SizedBox(
          height: AppDimens.height_12,
        ),
        ItemDetailTransactionWidget(
            image: Assets.images.calendar.path,
            title: (context.watch<DetailTransactionBloc>().state.data.time)
                .toString()),
        if (!isNullEmpty(
            context.watch<DetailTransactionBloc>().state.data.note))
          Column(
            children: [
              SizedBox(
                height: AppDimens.height_12,
              ),
              ItemDetailTransactionWidget(
                  image: Assets.images.note.path,
                  title:
                      (context.watch<DetailTransactionBloc>().state.data.note)
                          .toString()),
            ],
          ),
        if (!isNullEmptyList(
            context.watch<DetailTransactionBloc>().state.data.photos))
          Column(
            children: [
              SizedBox(
                height: AppDimens.height_12,
              ),
              ItemDetailTransactionWidget(
                image: Assets.images.colorCamera.path,
                title: CreateTransactionConstants.invoicePhotos,
              ),
            ],
          ),
        SizedBox(
          height: AppDimens.height_8,
        ),
      ],
    );
  }
}
