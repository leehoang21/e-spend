import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/buget_model.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/constants/app_dimens.dart';
import '../../../../../../themes/themes.dart';
import '../../../../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../../../../widgets/button_widget/text_button_widget.dart';
import '../../../../../../widgets/scaffold_wdiget/scaffold_widget.dart';
import 'detail_form.dart';

@RoutePage()
class DetailBugetScreenProvider extends StatelessWidget {
  const DetailBugetScreenProvider({Key? key, required this.bugetModel})
      : super(key: key);
  final BugetModel bugetModel;

  @override
  Widget build(BuildContext context) {
    return DetailBugetScreen(
      bugetModel: bugetModel,
    );
  }
}

class DetailBugetScreen extends StatefulWidget {
  final BugetModel bugetModel;

  const DetailBugetScreen({
    Key? key,
    required this.bugetModel,
  }) : super(key: key);
  @override
  State<DetailBugetScreen> createState() => _DetailBugetScreenState();
}

class _DetailBugetScreenState extends State<DetailBugetScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: const AppBarWidget(
        title: 'Chi tiết Giao dịch định kỳ',
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: AppDimens.height_24,
                    ),
                    DetailBugetForm(
                      bugetModel: widget.bugetModel,
                    ),
                    SizedBox(
                      height: AppDimens.height_12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButtonWidget(
                              onPressed: () {
                                context.pushRoute(
                                  CreateBugetRoute(),
                                );
                              },
                              title: 'update'.tr),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: TextButtonWidget(
                              buttonColor: AppColor.red,
                              onPressed: () {},
                              title: 'delete'.tr),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
