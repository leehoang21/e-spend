import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/constants/app_dimens.dart';
import '../../../../common/constants/string_constants.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../../presentation/themes/themes.dart';
import '../../../common/assets/fonts.gen.dart';
import '../text_field_widget/text_field_constants.dart';

class DropDownSelectCustome<T> extends StatelessWidget {
  final Function(T?)? onChanged;
  final String lable;
  final String hintText;
  final List<T> items;
  final T? value;
  final Color? borderColor;
  final double? borderRadius;
  final String? Function(T?)? validate;
  final bool? isRequired;
  final List<DropdownMenuItem<T>>? childBuilder;
  final VoidCallback? onTapEmpty;
  const DropDownSelectCustome({
    Key? key,
    this.onChanged,
    required this.lable,
    required this.hintText,
    required this.items,
    this.value,
    this.validate,
    this.isRequired,
    this.borderColor,
    this.borderRadius,
    this.childBuilder,
    this.onTapEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder commonBoder = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? AppColor.iron, width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(
          borderRadius ?? LayoutConstants.roundedRadius,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 16.sp,
              height: 1,
              fontWeight: FontWeight.bold,
              fontFamily: FontFamily.qs),
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        DropdownButtonFormField<T>(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColor.iron),
          elevation: 2,
          validator: validate ??
              (value) {
                return isRequired == true
                    ? isNullEmpty(value)
                        ? StringConstants.requiredThisField
                        : null
                    : null;
              },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: TextFieldConstants.contentPaddingHorizontal,
              vertical: TextFieldConstants.contentPaddingVertical,
            ),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            enabledBorder: commonBoder,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? AppColor.primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(
                    borderRadius ?? LayoutConstants.borderTextField),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.errorColor),
              borderRadius: BorderRadius.all(
                Radius.circular(
                    borderRadius ?? LayoutConstants.borderTextField),
              ),
            ),
            focusedErrorBorder: commonBoder,
            disabledBorder: commonBoder,
            border: commonBoder,
          ),
          dropdownColor: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(LayoutConstants.borderTextField),
          onChanged: onChanged,
          menuMaxHeight: 1.sw / 2,
          isExpanded: true,
          hint: Text(
            hintText,
            style: ThemeText.body2,
          ),
          items: childBuilder ??
              items.map((e) => _buildDropDownMenu(context, e)).toList(),
        ),
      ],
    );
  }

  DropdownMenuItem<T> _buildDropDownMenu(BuildContext context, T value) {
    return DropdownMenuItem<T>(
      value: value,
      child: Text(
        value.toString(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.sp),
      ),
    );
  }
}
