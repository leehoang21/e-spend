import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/journey/transaction/transaction_list_screen/bloc/transaction_list_cubit.dart';
import 'package:flutter_e_spend/presentation/journey/transaction/transaction_list_screen/widgets/item_filter.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../domain/use_cases/transaction_use_case.dart';
import '../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../widgets/loading_widget/loader_widget.dart';
import 'transaction_list_screen_constants.dart';
import 'widgets/filter_transaction_widget.dart';
import 'widgets/transaction_widget.dart';

class TransactionListScreen extends StatelessWidget {
  TransactionListScreen({Key? key}) : super(key: key);

  final bankSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: TransactionListScreenConstants.title.tr,
        action: Row(
          children: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.search,
            //     size: LayoutConstants.iconMediumSize,
            //     color: AppColor.primaryColor,
            //   ),
            // ),
            IconButton(
              onPressed: () {
                context.showBottomSheet(
                    child: FilterTransactionWidget(
                  parentContext: context,
                ));
              },
              icon: Assets.icons.filter.svg(
                height: LayoutConstants.iconSize,
                width: LayoutConstants.iconSize,
                colorFilter: const ColorFilter.mode(
                  AppColor.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(
              width: AppDimens.width_12,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FilterWidget(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: AppDimens.height_20),
              child: BlocBuilder<TransactionListCubit, TransactionListState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.data.length + 1,
                    itemBuilder: (context, index) {
                      if (index >= state.data.entries.length) {
                        return (state.params.documentSnapshot == null)
                            ? Container()
                            : VisibilityDetector(
                                key:
                                    Key('${UniqueKey().toString()}_loader_key'),
                                onVisibilityChanged: (info) {
                                  if (info.visibleFraction > 0) {
                                    context.read<TransactionListCubit>().get();
                                  }
                                },
                                child: SizedBox(
                                  height: LayoutConstants.iconMediumSize,
                                  width: LayoutConstants.iconMediumSize,
                                  child: const LoaderWidget(),
                                ),
                              );
                      }
                      return TransactionWidget(
                        data: state.data.entries.toList()[index],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterWidget extends StatelessWidget {
  const _FilterWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionListCubit, TransactionListState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDimens.height_24,
            ),
            if (state.categoryType != null)
              ItemFilter(
                title: state.categoryType.toString().tr,
                onPressed: () {
                  context.read<TransactionListCubit>().clearCategory();
                },
              ),
            SizedBox(
              height: AppDimens.height_12,
            ),
            if (state.params.toTime != ParamsTransactionUsecase.init().toTime ||
                state.params.fromTime !=
                    ParamsTransactionUsecase.init().fromTime)
              ItemFilter(
                title:
                    '${state.params.fromTime != ParamsTransactionUsecase.init().fromTime ? '${'From'.tr} ${state.params.fromTime.toDate().formatDMY}' : ''} ${state.params.toTime != ParamsTransactionUsecase.init().toTime ? '${'To'.tr} ${state.params.toTime.toDate().formatDMY}' : ''}',
                onPressed: () {
                  context.read<TransactionListCubit>().clearDate();
                },
              ),
          ],
        );
      },
    );
  }
}
