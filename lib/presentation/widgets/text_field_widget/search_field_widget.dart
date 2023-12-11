import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/debouncer.dart';
import '../../../../presentation/themes/themes.dart';
import 'text_field_widget.dart';

class SearchFieldWidget extends StatelessWidget {
  SearchFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });
  final TextEditingController controller;
  final Function(String) onChanged;
  final Debouncer debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
        textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColor.black,
            ),
        controller: controller,
        hintText: "Search".tr,
        height: 32.h,
        onChanged: (value) {
          debouncer.run(() {
            onChanged(value);
          });
        });
  }
}
