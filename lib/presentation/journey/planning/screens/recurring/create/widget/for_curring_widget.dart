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
import '../../../../../../widgets/button_widget/text_button_widget.dart';
import '../../../../../../widgets/drop_down_select/drop_down_select.dart';
import '../create_recurring_constants.dart';

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
  late final TextEditingController fromController;
  late final TextEditingController recurringCountController;
  late final TextEditingController recurringType;

  @override
  initState() {
    super.initState();
    fromController = widget.fromController;
    recurringCountController = widget.recurringCountController;
    recurringType = widget.recurringType;
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
            height: AppDimens.height_28,
          ),
          SizedBox(
            width: 1.sw,
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
                    fromController.text = value.formatDMY;
                  }
                });
              },
              child: TextFieldWidget(
                enabled: false,
                hintText: CreateRecurringConstants.from.tr,
                controller: fromController,
                prefixIcon: Assets.images.calendar.image(
                  height: LayoutConstants.iconMediumSize,
                  width: LayoutConstants.iconMediumSize,
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppDimens.space_16,
          ),
          Row(
            children: [
              Expanded(
                child: DropDownSelectCustome(
                  hintText: CreateRecurringConstants.loop.tr,
                  items: const [],
                  labelText: CreateRecurringConstants.hintLoop.tr,
                  childBuilder: fors,
                  onChanged: (value) {
                    recurringType.text = value.toString();
                  },
                ),
              ),
              SizedBox(
                width: AppDimens.width_8,
              ),
              recurringType.text == CreateRecurringConstants.none
                  ? Container()
                  : Expanded(
                      child: TextFieldWidget(
                        hintText: CreateRecurringConstants.hintCount.tr,
                        labelText: CreateRecurringConstants.count.tr,
                        controller: recurringCountController,
                        keyboardType: TextInputType.number,
                        prefixIcon: Assets.images.calendar.image(
                          height: LayoutConstants.iconMediumSize,
                          width: LayoutConstants.iconMediumSize,
                        ),
                      ),
                    ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppDimens.space_16, bottom: AppDimens.space_16),
            child: TextButtonWidget(
                buttonColor: AppColor.ebonyClay,
                title: CreateRecurringConstants.confirm.tr,
                onPressed: () {
                  widget.fromController.text = fromController.text;
                  widget.recurringCountController.text =
                      recurringCountController.text;
                  widget.recurringType.text = recurringType.text;
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> get fors {
    const listFor = CreateRecurringConstants.fors;
    final data = <DropdownMenuItem<String>>[];
    for (var i = 0; i < listFor.length; i++) {
      data.add(
        DropdownMenuItem<String>(
          value: listFor[i],
          child: Text(
            listFor[i].tr,
            style: ThemeText.overline,
          ),
        ),
      );
    }

    return data;
  }
}
