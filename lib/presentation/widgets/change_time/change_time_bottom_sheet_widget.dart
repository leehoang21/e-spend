import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/time_model.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_e_spend/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/change_time/time/time_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drop_down_select/drop_down_select.dart';

class ChangeTimeBottomSheetWidget extends StatefulWidget {
  const ChangeTimeBottomSheetWidget({super.key});

  @override
  State<ChangeTimeBottomSheetWidget> createState() =>
      _ChangeTimeBottomSheetWidgetState();
}

class _ChangeTimeBottomSheetWidgetState
    extends State<ChangeTimeBottomSheetWidget> {
  TimeModel _time = const TimeModel();
  FilterBy? _filterBy;

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
            height: AppDimens.height_44,
            child: DropDownSelectCustome(
              hintText: 'Filter with'.tr,
              items: filterBy,
              onChanged: (value) {
                _filterBy = value;
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: AppDimens.height_12,
          ),
          SizedBox(
            width: 1.sw,
            child: _filterBy == FilterBy.month ||
                    _filterBy == null ||
                    _filterBy == FilterBy.year
                ? const SizedBox()
                : DropDownSelectCustome(
                    hintText: 'day'.tr,
                    items: dates,
                    onChanged: (value) {
                      _time = _time.copyWith(day: value);
                    },
                  ),
          ),
          SizedBox(
            height: AppDimens.height_8,
          ),
          SizedBox(
            width: 1.sw,
            child: _filterBy == FilterBy.year || _filterBy == null
                ? const SizedBox()
                : DropDownSelectCustome(
                    hintText: 'month'.tr,
                    items: months,
                    onChanged: (value) {
                      _time = _time.copyWith(month: value);
                    },
                  ),
          ),
          SizedBox(
            height: AppDimens.height_8,
          ),
          SizedBox(
            width: 1.sw,
            child: _filterBy == null
                ? const SizedBox()
                : DropDownSelectCustome(
                    hintText: 'year'.tr,
                    items: years,
                    onChanged: (value) {
                      _time = _time.copyWith(year: value);
                    },
                  ),
          ),
          SizedBox(
            height: AppDimens.height_20,
          ),
          TextButtonWidget(
            width: 1.sw,
            onPressed: () {
              context.read<TimeCubit>().changeTime(_time);
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

  List<int> dates = List.generate(31, (index) => index + 1);
  List<int> months = List.generate(12, (index) => index + 1);
  List<int> years = List.generate(100, (index) => DateTime.now().year - index);
  List<FilterBy> filterBy = [
    FilterBy.day,
    FilterBy.month,
    FilterBy.year,
  ];
}

enum FilterBy {
  day,
  month,
  year,
}
