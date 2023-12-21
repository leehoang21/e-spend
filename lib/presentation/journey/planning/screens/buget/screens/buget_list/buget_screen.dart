import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/card_widget/card_custom.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../themes/themes.dart';
import '../../../../../../widgets/image_app_widget/image_app.dart';
import 'buget_constants.dart';

class BugetScreen extends StatelessWidget {
  const BugetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final result = await context.pushRoute(const CreateWalletRoute());

          // if (result is bool && result) {
          //   await context.read<WalletListCubit>().getWalletList();
          // }
        },
        child: Icon(
          Icons.add_rounded,
          size: AppDimens.height_52,
        ),
      ),
      appbar: AppBarWidget(
        title: BugetConstants.title.tr,
      ),
      body: Column(
        children: [
          CardCustom(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 5.h,
                          ),
                          child: Row(
                            children: [
                              AppImageWidget(
                                path: Assets.icons.addCircle.path,
                                width: 26.sp,
                                height: 26.sp,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'title',
                                style: ThemeText.caption.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'đến 21/11/2021',
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          'ngân sách 888 triệu',
                        ),
                        Text(
                          'còn lại 333 triệu',
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
        ],
      ),
    );
  }
}
