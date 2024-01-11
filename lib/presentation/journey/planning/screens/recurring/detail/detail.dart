import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/recurring_model.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/constants/app_dimens.dart';
import '../../../../../themes/themes.dart';
import '../../../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../../../widgets/button_widget/text_button_widget.dart';
import '../../../../../widgets/scaffold_wdiget/scaffold_widget.dart';
import 'detail_form.dart';

@RoutePage()
class DetailRecurringScreenProvider extends StatelessWidget {
  const DetailRecurringScreenProvider({Key? key, required this.model})
      : super(key: key);
  final RecurringModel model;

  @override
  Widget build(BuildContext context) {
    return DetailRecurringScreen(
      model: model,
    );
  }
}

class DetailRecurringScreen extends StatefulWidget {
  final RecurringModel model;

  const DetailRecurringScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  State<DetailRecurringScreen> createState() => _DetailRecurringScreenState();
}

class _DetailRecurringScreenState extends State<DetailRecurringScreen> {
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
                    DetailRecurringForm(
                      model: widget.model,
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
