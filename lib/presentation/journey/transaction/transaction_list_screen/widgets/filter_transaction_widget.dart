import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/__mock__/categories_mock.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/transaction_use_case.dart';
import 'package:flutter_e_spend/presentation/journey/transaction/transaction_list_screen/bloc/transaction_list_cubit.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_e_spend/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../widgets/drop_down_select/drop_down_select.dart';

class FilterTransactionWidget extends StatefulWidget {
  const FilterTransactionWidget({
    super.key,
    required this.parentContext,
  });
  final BuildContext parentContext;

  @override
  State<FilterTransactionWidget> createState() =>
      _FilterTransactionWidgetState();
}

class _FilterTransactionWidgetState extends State<FilterTransactionWidget> {
  late final TextEditingController fromController;
  late final TextEditingController toController;
  DateTime? _fromDate;
  DateTime? _toDate;
  CategoryType? _categoryType;

  @override
  void initState() {
    fromController = TextEditingController();
    toController = TextEditingController();
    final state = widget.parentContext.read<TransactionListCubit>().state;
    if (state.params.fromTime != ParamsTransactionUsecase.init().fromTime) {
      _fromDate = state.params.fromTime.toDate();
      fromController.text = _fromDate!.formatDMY;
    }
    if (state.params.toTime != ParamsTransactionUsecase.init().toTime) {
      _toDate = state.params.toTime.toDate();
      toController.text = _toDate!.formatDMY;
    }
    _categoryType = state.categoryType;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: AppDimens.width_16,
        right: AppDimens.width_16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: AppDimens.height_4,
          ),
          Text(
            'Filter transaction'.tr,
            style: ThemeText.body1.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: AppDimens.height_28,
          ),
          SizedBox(
            width: 1.sw,
            child: DropDownSelectCustome(
              prefixIcon: Assets.icons.categories.image(
                height: LayoutConstants.iconMediumSize,
                width: LayoutConstants.iconMediumSize,
              ),
              hintText: _categoryType == null
                  ? 'Category'.tr
                  : _categoryType.toString().tr,
              items: categories,
              onChanged: (value) {
                _categoryType = value;
              },
            ),
          ),
          SizedBox(
            height: AppDimens.height_12,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showDatePicker(
                      locale: LocalizedApp.of(context).delegate.currentLocale,
                      initialDate: _fromDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                      context: context,
                    ).then((value) {
                      if (value != null) {
                        _fromDate = value;
                        fromController.text = value.formatDMY;
                      }
                    });
                  },
                  child: TextFieldWidget(
                    enabled: false,
                    hintText: 'From'.tr,
                    controller: fromController,
                    prefixIcon: Assets.images.calendar.image(
                      height: LayoutConstants.iconMediumSize,
                      width: LayoutConstants.iconMediumSize,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppDimens.width_8,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showDatePicker(
                      locale: LocalizedApp.of(context).delegate.currentLocale,
                      initialDate: _toDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                      context: context,
                    ).then((value) {
                      if (value != null) {
                        _toDate = value;
                        toController.text = value.formatDMY;
                      }
                    });
                  },
                  child: TextFieldWidget(
                    enabled: false,
                    hintText: 'To'.tr,
                    controller: toController,
                    prefixIcon: Assets.images.calendar.image(
                      height: LayoutConstants.iconMediumSize,
                      width: LayoutConstants.iconMediumSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.height_20,
          ),
          TextButtonWidget(
            width: 1.sw,
            onPressed: () {
              var params = widget.parentContext
                  .read<TransactionListCubit>()
                  .state
                  .params;
              params = params.copyWith(
                fromTime:
                    _fromDate == null ? null : Timestamp.fromDate(_fromDate!),
                toTime: _toDate == null ? null : Timestamp.fromDate(_toDate!),
              );
              widget.parentContext.read<TransactionListCubit>().changeParams(
                    params,
                    _categoryType,
                  );
              context.popRoute();
            },
            title: 'Confirm'.tr,
          ),
          SizedBox(
            height: AppDimens.height_28,
          ),
        ],
      ),
    );
  }

  List<CategoryType> get categories {
    List<CategoryType> data = [];
    for (final item in MockData.categoriesData) {
      data.add(item.category);
      // if (!isNullEmptyList(item.subCategories)) {
      //   data.addAll(item.subCategories!.map((e) => e.category));
      // } else {
      //   data.add(item.category);
      // }
    }
    return data;
  }
}
