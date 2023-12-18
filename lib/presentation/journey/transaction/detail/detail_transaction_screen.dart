import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/constants/app_dimens.dart';
import '../../../themes/themes.dart';
import '../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/scaffold_wdiget/scaffold_widget.dart';
import 'detail_transaction_constants.dart';
import 'widget/detail_photo_widget.dart';
import 'widget/detail_transaction_form.dart';

class DetailTransactionScreen extends StatefulWidget {
  const DetailTransactionScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<DetailTransactionScreen> createState() =>
      _DetailTransactionScreenState();
}

class _DetailTransactionScreenState extends State<DetailTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: DetailTransactionConstants.detailTransaction,
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
                    const DetailTransactionForm(),
                    SizedBox(
                      height: AppDimens.height_12,
                    ),
                    const DetailPhotoWidget(),
                    SizedBox(
                      height: AppDimens.height_36,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButtonWidget(
                              onPressed: () {
                                context.popRoute(
                                   CreateTransactionRoute(),
                                );
                              },
                              title: DetailTransactionConstants.update),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: TextButtonWidget(
                              buttonColor: AppColor.red,
                              onPressed: () {},
                              title: DetailTransactionConstants.delete),
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
