import 'package:cloud_firestore/cloud_firestore.dart';
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

  String get formatYear {
    return DateFormat('MMM, yyyy').format(this);
  }

  String get formatDMY {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String get formatY {
    return DateFormat('yyyy').format(this);
  }
}

extension TimestampExtension on Timestamp {
  String get formatDateMonth {
    final time = toDate();
    if (time.day == 1) {
      return '${DateFormat('MMM, d').format(time)}st';
    } else if (time.day == 2) {
      return '${DateFormat('MMM, d').format(time)}nd';
    } else if (time.day == 3) {
      return '${DateFormat('MMM, d').format(time)}rd';
    }
    return '${DateFormat('MMM, d').format(time)}th';
  }
}
