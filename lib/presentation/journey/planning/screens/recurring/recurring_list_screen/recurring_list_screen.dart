import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/recurring_model.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../common/assets/assets.gen.dart';
import '../../../../../../common/constants/app_dimens.dart';
import '../../../../../../common/constants/string_constants.dart';
import '../../../../../../common/utils/app_utils.dart';
import '../../../../../bloc/schedule/schedule_cubit.dart';
import '../../../../../themes/themes.dart';
import '../../../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../../../widgets/image_app_widget/image_app.dart';
import '../../../../../widgets/loading_widget/loader_widget.dart';
import '../../../../../widgets/refresh_widget.dart';

class RecurringListScreen extends StatelessWidget {
  RecurringListScreen({
    Key? key,
  }) : super(key: key);

  final refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        centerWidget: Text(
          'Recurrings'.tr,
          textAlign: TextAlign.center,
          style: ThemeText.style18Bold.copyWith(color: AppColor.white),
        ),
        //  color: AppColor.ebonyClay,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: AppDimens.height_20),
        child: BlocBuilder<RecurringListCubit, RecurringListState>(
            builder: (context, state) {
          if (state is RecurringListLoaded) {
            return RefreshWidget(
                controller: refreshController,
                onRefresh: () async {
                  await context.read<RecurringListCubit>().getRecurringList();
                  refreshController.refreshCompleted();
                },
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      _buildRecurringItem(context, state.list[index]),
                  itemCount: state.list.length,
                ));
          }

          if (RecurringListState is RecurringListError) {
            return Center(
              child: Text('error_message'.tr),
            );
          }
          if (RecurringListState is RecurringListNoResult) {
            return Container();
          }

          return const LoaderWidget();
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.black,
        onPressed: () async {
          await context.pushRoute(CreateRecurringRoute());
        },
        child: Icon(
          Icons.add_rounded,
          size: AppDimens.height_52,
        ),
      ),
    );
  }

  Widget _buildRecurringItem(BuildContext context, RecurringModel data) {
    return InkWell(
      onTap: () async {
        context.pushRoute(DetailRecurringRoute(model: data));
      },
      child: Container(
        margin: EdgeInsets.only(
            bottom: AppDimens.space_16,
            left: AppDimens.space_16,
            right: AppDimens.space_16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(AppDimens.radius_16),
          boxShadow: [
            BoxShadow(
              color: AppColor.ebonyClay.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: AppDimens.space_16,
                  top: AppDimens.space_4,
                  bottom: AppDimens.space_4,
                  right: AppDimens.space_16),
              width: AppDimens.height_60,
              height: AppDimens.height_60,
              child: Stack(
                children: [
                  AppImageWidget(
                      path:
                          "${StringConstants.imagePath}${data.category?.title.toLowerCase()}.png",
                      height: AppDimens.height_52,
                      width: AppDimens.height_52),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: AppImageWidget(
                        path: isNullEmpty(data.wallet?.walletImage)
                            ? Assets.images.icWallet.path
                            : data.wallet?.walletImage,
                        height: AppDimens.height_28,
                        width: AppDimens.height_28),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: AppDimens.space_4),
              width: 230,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.repeat?.type?.title.tr ?? "",
                      style: ThemeText.style14Medium,
                      softWrap: true,
                      maxLines: 2,
                    ),
                    Text(
                      formatMoney(data.defaultAmount.toString()),
                      style: ThemeText.style12Regular
                          .copyWith(color: AppColor.green),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
