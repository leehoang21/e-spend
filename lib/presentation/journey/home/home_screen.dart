import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/utils/format_utils.dart';
import '../../themes/themes.dart';
import '../../widgets/card_widget/card_custom.dart';
import '../../widgets/image_app_widget/image_app.dart';
import '../../widgets/refresh_widget.dart';
import 'cubit/home_cubit.dart';
import 'home_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key ?? HomeConstants.key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: RefreshWidget(
                controller: _refreshController,
                enableLoadMore: false,
                onRefresh: () async {
                  await context.read<HomeCubit>().onInit();
                  _refreshController.refreshCompleted();
                  return Future.value();
                },
                child: SingleChildScrollView(
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
                                _selectDate(context);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Assets.images.calendar.image(),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    formatYear(time),
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
                            Row(
                              children: [
                                Expanded(
                                  child: CardCustom(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Revenue'.tr,
                                          style: ThemeText.caption,
                                        ),
                                        Text(
                                          context.watch<HomeCubit>().revenue,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Expenses'.tr,
                                          style: ThemeText.caption,
                                        ),
                                        Text(
                                          context.watch<HomeCubit>().expense,
                                          style: ThemeText.body1.copyWith(
                                            color: AppColor.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CardCustom(
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
                                        context.watch<HomeCubit>().total > 0
                                            ? Icons.arrow_upward
                                            : Icons.arrow_downward,
                                        color:
                                            context.watch<HomeCubit>().total > 0
                                                ? AppColor.blue
                                                : AppColor.red,
                                        size: 18.sp,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        '${context.watch<HomeCubit>().total}đ',
                                        style: ThemeText.body1.copyWith(
                                          color:
                                              context.watch<HomeCubit>().total >
                                                      0
                                                  ? AppColor.blue
                                                  : AppColor.red,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: TextButton(
                                  //     onPressed: () {
                                  //       Injector.getIt
                                  //           .get<TabMangerCubit>()
                                  //           .changePage(1);
                                  //     },
                                  //     child: Row(
                                  //       mainAxisSize: MainAxisSize.min,
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       children: [
                                  //         AppImageWidget(
                                  //           path: IconConstants.icMoney,
                                  //           width: 18.sp,
                                  //           height: 18.sp,
                                  //         ),
                                  //         Text(
                                  //           "Report",
                                  //           style: ThemeText.caption.copyWith(
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                      if (context.watch<HomeCubit>().data(false).isNotEmpty)
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            children: context
                                .watch<HomeCubit>()
                                .data(false)
                                .entries
                                .map<Widget>((e) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.key,
                                        style: ThemeText.caption,
                                      ),
                                      Text(
                                        '${e.value.fold(0, (previousValue, element) {
                                          if (element.category.category.type !=
                                              'EXPENSES') {
                                            return previousValue +
                                                element.amount;
                                          }
                                          return previousValue - element.amount;
                                        })}đ',
                                        style: ThemeText.caption.copyWith(
                                          color: AppColor.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  for (var item in e.value)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 44.sp,
                                            height: 44.sp,
                                            child: AppImageWidget(
                                                path:
                                                    "${StringConstants.imagePath}${item.category.category.title.toLowerCase()}.png"),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "transaction_category_screen_${(item.category.category.title).toLowerCase()}"
                                                    .tr,
                                                style: ThemeText.caption,
                                              ),
                                              Text(
                                                item.note ?? '',
                                                style: ThemeText.overline,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${item.category.category.type == 'EXPENSES' ? '-' : '+'}${item.amount}đ',
                                            style: ThemeText.caption.copyWith(
                                              color:
                                                  item.category.category.type ==
                                                          'EXPENSES'
                                                      ? AppColor.red
                                                      : AppColor.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _selectDate(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: CupertinoDatePicker(
            onDateTimeChanged: (date) {
              _onChangeDate(date, context);
            },
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            maximumDate: DateTime.now(),
          ),
        );
      },
    );
  }

  void _onChangeDate(DateTime date, BuildContext context) {
    context.read<HomeCubit>().changeDate(date);
    setState(() {});
  }
}
