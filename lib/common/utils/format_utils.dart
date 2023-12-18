import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

class AmountInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final oldValueText = oldValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String newValueText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (oldValueText == newValueText) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }
    if (newValueText.isEmpty) {
      newValueText = '0';
    }
    double value = double.parse(newValueText);

    final formatter = NumberFormat.simpleCurrency(locale: "vi_VN");

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
