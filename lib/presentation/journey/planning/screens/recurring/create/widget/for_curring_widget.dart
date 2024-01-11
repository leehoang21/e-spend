import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';

import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/recurring_model.dart';
import 'package:flutter_e_spend/presentation/journey/planning/screens/recurring/create/bloc/create/create_recurring_bloc.dart';
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
    required this.repeat,
    required this.onConfirm,
  });
  final BuildContext parentContext;
  final Repeat repeat;
  final Function(Repeat repeat) onConfirm;

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
    fromController = TextEditingController();
    recurringCountController = TextEditingController();
    recurringType = TextEditingController();
    fromController.text = (widget.repeat.startTime ?? DateTime.now()).formatDMY;
    recurringType.text =
        widget.repeat.type?.title ?? CreateRecurringConstants.none;
    recurringCountController.text = widget.repeat.length?.toString() ?? '';
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
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                width: AppDimens.width_8,
              ),
              recurringType.text == RepeatType.none.title
                  ? Container()
                  : Expanded(
                      child: TextFieldWidget(
                        hintText: CreateRecurringConstants.hintCount.tr,
                        labelText: CreateRecurringConstants.count.tr,
                        controller: recurringCountController,
                        keyboardType: const TextInputType.numberWithOptions(),
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
                  final repeat = Repeat(
                    startTime: fromController.text.toDate,
                    type: repeatTypeFromString(recurringType.text),
                    length: int.tryParse(recurringCountController.text),
                  );
                  widget.onConfirm(repeat);
                  widget.parentContext
                      .read<CreateRecurringBloc>()
                      .changeRepeat(repeat);
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<RepeatType>> get fors {
    const listFor = CreateRecurringConstants.fors;
    final data = <DropdownMenuItem<RepeatType>>[];
    for (var i = 0; i < listFor.length; i++) {
      data.add(
        DropdownMenuItem<RepeatType>(
          value: listFor[i],
          child: Text(
            listFor[i].title.tr,
            style: ThemeText.overline,
          ),
        ),
      );
    }

    return data;
  }
}
