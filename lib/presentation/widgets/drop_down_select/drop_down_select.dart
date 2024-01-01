import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/constants/string_constants.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../../presentation/themes/themes.dart';
import '../text_field_widget/text_field_constants.dart';

class DropDownSelectCustome<T> extends StatelessWidget {
  final Function(T?)? onChanged;
  final String hintText;
  final List<T> items;
  final T? value;
  final Color? borderColor;
  final double? borderRadius;
  final String? Function(T?)? validate;
  final bool? isRequired;
  final List<DropdownMenuItem<T>>? childBuilder;
  final VoidCallback? onTapEmpty;
  final Widget? prefixIcon;
  final String labelText;
  const DropDownSelectCustome({
    Key? key,
    this.onChanged,
    required this.hintText,
    required this.items,
    this.value,
    this.validate,
    this.isRequired,
    this.borderColor,
    this.borderRadius,
    this.childBuilder,
    this.onTapEmpty,
    this.prefixIcon,
    this.labelText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
      ),
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
        fillColor: AppColor.fieldColor,
        prefixIcon: prefixIcon,
        filled: true,
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
      ),
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(LayoutConstants.borderTextField),
      onChanged: onChanged,
      menuMaxHeight: 1.sw / 2,
      isExpanded: true,
      hint: Text(
        hintText,
        style: ThemeText.caption.copyWith(
          color: AppColor.tuna,
        ),
      ),
      items: childBuilder ??
          items.map((e) => _buildDropDownMenu(context, e)).toList(),
    );
  }

  DropdownMenuItem<T> _buildDropDownMenu(BuildContext context, T value) {
    return DropdownMenuItem<T>(
      value: value,
      child: Text(
        value.toString().tr,
        style: ThemeText.caption.copyWith(
          color: AppColor.tuna,
        ),
      ),
    );
  }
}
