import 'package:flutter_translate/flutter_translate.dart';

import '../constants/string_constants.dart';

extension StringExtension on String {
  String get toTitleCase {
    if (isEmpty) {
      return this;
    } else {
      final lowerCaseText = toLowerCase();
      return lowerCaseText.substring(0, 1).toUpperCase() +
          lowerCaseText.substring(1);
    }
  }

  String get tr {
    return translate(this);
  }

  String get formatPhoneToEmail {
    String phone = this;
    phone = phone.replaceAll(' ', '');

    return '${StringConstants.espend}$phone@${StringConstants.espend}.com';
  }
}
