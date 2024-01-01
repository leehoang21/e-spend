import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/widgets/change_time/change_time_bottom_sheet_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/loading_widget/loader_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../themes/themes.dart';
import '../../widgets/card_widget/card_custom.dart';
import '../../widgets/change_time/time/time_cubit.dart';
import '../transaction/transaction_list_screen/widgets/transaction_widget.dart';
import 'cubit/home_cubit.dart';
import 'home_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key ?? HomeConstants.key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeCubit>(),
      child: BlocListener<TimeCubit, TimeState>(
        listener: (context, state) {
          context.read<HomeCubit>().changeDate(state.time);
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light.copyWith(
                    statusBarColor:
                        Theme.of(context).appBarTheme.backgroundColor),
                child: Scaffold(
                  body: RefreshIndicator(
                    onRefresh: () async {
                      context.read<HomeCubit>().onInit();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppDimens.height_20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          child: Column(
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
                                      context
                                          .watch<TimeCubit>()
                                          .state
                                          .time
                                          .toString(),
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
                              const StatisticWidget(),
                              SizedBox(
                                height: 20.h,
                              ),
                              const TotalWidget(),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                        if (context.watch<HomeCubit>().state.data.isNotEmpty)
                          const Expanded(
                            child: HomeTramsaction(),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class StatisticWidget extends StatelessWidget {
  const StatisticWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CardCustom(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Revenue'.tr,
                  style: ThemeText.caption,
                ),
                Text(
                  context
                      .watch<HomeCubit>()
                      .state
                      .statistic
                      .$1
                      .getTextCompactCurrencyAmount,
                  style: ThemeText.body1.copyWith(
                    color: AppColor.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: CardCustom(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Expenses'.tr,
                  style: ThemeText.caption,
                ),
                Text(
                  (-context.watch<HomeCubit>().state.statistic.$2)
                      .getTextCompactCurrencyAmount,
                  style: ThemeText.body1.copyWith(
                    color: AppColor.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardCustom(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total'.tr,
            style: ThemeText.caption,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (context.watch<HomeCubit>().state.statistic.$1 +
                            context.watch<HomeCubit>().state.statistic.$2) >=
                        0
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                color: (context.watch<HomeCubit>().state.statistic.$1 +
                            context.watch<HomeCubit>().state.statistic.$2) >=
                        0
                    ? AppColor.blue
                    : AppColor.red,
                size: 18.sp,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                (context.watch<HomeCubit>().state.statistic.$1 +
                        context.watch<HomeCubit>().state.statistic.$2)
                    .getTextCompactCurrencyAmount,
                style: ThemeText.body1.copyWith(
                  color: (context.watch<HomeCubit>().state.statistic.$1 +
                              context.watch<HomeCubit>().state.statistic.$2) >=
                          0
                      ? AppColor.blue
                      : AppColor.red,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeTramsaction extends StatelessWidget {
  const HomeTramsaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.data.entries.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.data.entries.length) {
                return (state.lastDocument == null)
                    ? Container()
                    : VisibilityDetector(
                        key: Key('${UniqueKey().toString()}_loader_key'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0) {
                            context.read<HomeCubit>().get();
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
    );
  }
}
