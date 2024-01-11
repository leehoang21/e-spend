import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/journey/planning/screens/buget/screens/buget_list/cubit/buget_cubit.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/card_widget/card_custom.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../common/constants/string_constants.dart';
import '../../../../../../routers/app_router.dart';
import '../../../../../../widgets/image_app_widget/image_app.dart';
import 'buget_constants.dart';

class BugetScreen extends StatelessWidget {
  const BugetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushRoute(CreateBugetRoute());
        },
        child: Icon(
          Icons.add_rounded,
          size: AppDimens.height_52,
        ),
      ),
      appbar: AppBarWidget(
        title: BugetConstants.title.tr,
      ),
      body: BlocBuilder<BugetCubit, BugetState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.bugets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    await context.pushRoute(
                        DetailBugetRoute(bugetModel: state.bugets[index]));
                  },
                  child: CardCustom(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${BugetConstants.from.tr} ${(state.bugets[index].createAt ?? DateTime.now()).formatDMY}'
                          ' ${BugetConstants.to.tr} ${state.bugets[index].lastAt!.formatDMY}',
                          style: ThemeText.caption,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimens.space_4,
                                      bottom: AppDimens.space_4,
                                      right: AppDimens.space_4),
                                  width: AppDimens.height_60,
                                  height: AppDimens.height_60,
                                  child: Stack(
                                    children: [
                                      AppImageWidget(
                                          path:
                                              "${StringConstants.imagePath}${CategoryType.restaurant.title.toLowerCase()}.png",
                                          height: AppDimens.height_52,
                                          width: AppDimens.height_52),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: AppImageWidget(
                                            path: Assets.images.icWallet.path,
                                            height: AppDimens.height_28,
                                            width: AppDimens.height_28),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "transaction_category_screen_${CategoryType.restaurant.title.toLowerCase()}"
                                          .tr,
                                      style: ThemeText.caption,
                                    ),
                                    Text(
                                      'tiền mặt',
                                      style: ThemeText.caption,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '888 triệu',
                                  style: ThemeText.body2.copyWith(),
                                ),
                                Text(
                                  'còn lại 333 triệu',
                                  style: ThemeText.caption
                                      .copyWith(color: AppColor.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: (1.sw - 20.w) * 0.334,
                              height: AppDimens.height_12,
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: AppDimens.height_12,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
