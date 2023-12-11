import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get getTextDate {
    final now = DateTime.now();
    if (this == DateTime(now.year, now.month, now.day)) {
      return translate('date_time.today');
    } else if (this == DateTime(now.year, now.month, now.day - 1)) {
      return translate('date_time.yesterday');
    } else {
      return DateFormat('dd/MM/yyyy').format(this);
    }
  }

  DateTime get date => DateTime(year, month, day);
}
