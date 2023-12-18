import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/presentation/journey/statistics/cubit/statistic_cubit.dart';
import 'package:flutter_e_spend/presentation/widgets/card_widget/card_custom.dart';
import 'package:flutter_e_spend/presentation/widgets/refresh_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/assets/assets.gen.dart';
import '../../../common/enums/category.dart';
import '../../themes/themes.dart';
import '../../widgets/change_time/change_time_bottom_sheet_widget.dart';
import '../../widgets/change_time/time/time_cubit.dart';
import 'widgets/debt_and_loan_widget.dart';
import 'widgets/line_chart_widget.dart';
import 'widgets/pie_chart_widget.dart';
import 'statistic_screen_constants.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({Key? key})
      : super(key: key ?? StatisticScreenConstant.key);

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      enableLoadMore: false,
      onRefresh: () async {
        await context.read<StatisticCubit>().onInit();
      },
      child: BlocListener<TimeCubit, TimeState>(
        listener: (context, state) {
          context.read<StatisticCubit>().changeStatistic();
        },
        child: ScaffoldWidget(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.showBottomSheet(
                      child: const ChangeTimeBottomSheetWidget(),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.images.calendar.image(),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        context.watch<TimeCubit>().state.time.toString(),
                        style: ThemeText.body1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CardCustom(
                  child: LineChartWidget(
                    data: context
                        .watch<StatisticCubit>()
                        .state
                        .data
                        .entries
                        .map((e) => MapEntry(e.key, e.value))
                        .where((element) {
                      return element.key.categoryType.title ==
                          element.key.title;
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: AppDimens.height_20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CardCustom(
                        child: PieChartWidget(
                          data: context.watch<StatisticCubit>().state.data,
                          categoryType: CategoryType.revenue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppDimens.width_8,
                    ),
                    Expanded(
                      child: CardCustom(
                        child: PieChartWidget(
                          data: context.watch<StatisticCubit>().state.data,
                          categoryType: CategoryType.expense,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimens.height_20,
                ),
                //debt and loan
                Row(
                  children: [
                    Expanded(
                      child: DebtsAndLoanWidget(
                        data: context
                                .watch<StatisticCubit>()
                                .state
                                .data[CategoryType.debt] ??
                            0,
                        type: CategoryType.debt,
                      ),
                    ),
                    SizedBox(
                      width: AppDimens.width_8,
                    ),
                    Expanded(
                      child: DebtsAndLoanWidget(
                        data: context
                                .watch<StatisticCubit>()
                                .state
                                .data[CategoryType.loan] ??
                            0,
                        type: CategoryType.loan,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
