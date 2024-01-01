import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';

import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_e_spend/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../../../../../widgets/drop_down_select/drop_down_select.dart';

class ForCurringWidget extends StatefulWidget {
  const ForCurringWidget({
    super.key,
    required this.parentContext,
    required this.fromController,
    required this.recurringCountController,
    required this.recurringType,
  });
  final BuildContext parentContext;
  final TextEditingController fromController;
  final TextEditingController recurringCountController;
  final TextEditingController recurringType;

  @override
  State<ForCurringWidget> createState() => _ForCurringWidgetState();
}

class _ForCurringWidgetState extends State<ForCurringWidget> {
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
            height: AppDimens.height_28,
          ),
          SizedBox(
            width: 1.sw,
            child: DropDownSelectCustome(
              prefixIcon: Assets.icons.categories.image(
                height: LayoutConstants.iconMediumSize,
                width: LayoutConstants.iconMediumSize,
              ),
              hintText: 'for'.tr,
              items: const [],
              childBuilder: fors,
              onChanged: (value) {
                widget.recurringType.text = value.toString();
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
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                      context: context,
                    ).then((value) {
                      if (value != null) {
                        widget.fromController.text = value.formatDMY;
                      }
                    });
                  },
                  child: TextFieldWidget(
                    enabled: false,
                    hintText: 'From'.tr,
                    controller: widget.fromController,
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
                child: TextFieldWidget(
                  hintText: 'acount'.tr,
                  controller: widget.recurringCountController,
                  keyboardType: TextInputType.number,
                  prefixIcon: Assets.images.calendar.image(
                    height: LayoutConstants.iconMediumSize,
                    width: LayoutConstants.iconMediumSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> get fors {
    final listFor = [
      'day',
      'week',
      'month',
      'year',
    ];
    final data = <DropdownMenuItem<String>>[];
    for (var i = 0; i < listFor.length; i++) {
      data.add(
        DropdownMenuItem<String>(
          value: listFor[i],
          child: Text(
            listFor[i].tr,
            style: ThemeText.body1.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    return data;
  }
}
