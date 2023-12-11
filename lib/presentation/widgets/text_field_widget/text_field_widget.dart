import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/layout_constants.dart';
import '../../../../presentation/themes/themes.dart';
import 'text_field_constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final Color? color;
  final double? height;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatter;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;
  final bool? enabled;

  const TextFieldWidget({
    Key? key,
    this.enabled,
    this.labelText,
    this.hintText,
    this.initValue,
    this.color,
    this.height,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.validate,
    this.onSaved,
    this.onEditingComplete,
    this.onTap,
    this.autovalidateMode,
    this.inputFormatter,
    this.textAlign,
    this.textCapitalization,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      enabled: enabled,
      controller: controller,
      initialValue: initValue,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      textAlign: textAlign ?? TextAlign.start,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText ?? false,
      style: textStyle ??
          ThemeText.caption
              .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
      onSaved: onSaved,
      validator: validate,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatter,
      keyboardType: keyboardType,
      scrollPadding: EdgeInsets.symmetric(vertical: 9.h),
      cursorColor: AppColor.hintColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: TextFieldConstants.contentPaddingHorizontal,
          vertical: TextFieldConstants.contentPaddingVertical,
        ),
        labelText: labelText,
        labelStyle: textStyle ??
            ThemeText.caption
                .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
        hintText: hintText,
        hintStyle: textStyle ??
            ThemeText.caption
                .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: AppColor.fieldColor,
        filled: true,
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
    );
  }
}

class SecurityTextFieldWidget extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final Color? color;
  final double? height;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatter;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? enabled;

  const SecurityTextFieldWidget({
    Key? key,
    this.enabled,
    this.labelText,
    this.hintText,
    this.initValue,
    this.color,
    this.height,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.validate,
    this.onSaved,
    this.onEditingComplete,
    this.onTap,
    this.autovalidateMode,
    this.inputFormatter,
    this.textAlign,
    this.textCapitalization,
    this.keyboardType,
    this.readOnly,
  }) : super(key: key);

  @override
  State<SecurityTextFieldWidget> createState() =>
      _SecurityTextFieldWidgetState();
}

class _SecurityTextFieldWidgetState extends State<SecurityTextFieldWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      enabled: widget.enabled,
      controller: widget.controller,
      initialValue: widget.initValue,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      textAlign: widget.textAlign ?? TextAlign.start,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText,
      style: widget.textStyle ??
          ThemeText.caption
              .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
      onSaved: widget.onSaved,
      validator: widget.validate,
      autovalidateMode: widget.autovalidateMode,
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      scrollPadding: EdgeInsets.symmetric(vertical: 9.h),
      cursorColor: AppColor.hintColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: TextFieldConstants.contentPaddingHorizontal,
          vertical: TextFieldConstants.contentPaddingVertical,
        ),
        labelText: widget.labelText,
        labelStyle: widget.textStyle ??
            ThemeText.caption
                .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
        hintText: widget.hintText,
        hintStyle: widget.textStyle ??
            ThemeText.caption
                .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
        prefixIcon: widget.prefixIcon,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: widget.suffixIcon ??
              Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColor.tuna,
              ),
        ),
        fillColor: AppColor.fieldColor,
        filled: true,
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
    );
  }
}
