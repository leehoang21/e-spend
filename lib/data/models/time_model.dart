import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';

class TimeModel extends Equatable {
  final int day;
  final int month;
  final int year;

  const TimeModel({
    this.day = 0,
    this.month = 0,
    this.year = 0,
  });

  @override
  List<Object?> get props => [
        day,
        month,
        year,
      ];

  DateTime get toDate {
    if (year == 0) {
      return DateTime(DateTime.now().year, DateTime.now().month);
    } else if (month == 0) {
      return DateTime(year);
    } else if (day == 0) {
      return DateTime(year, month);
    } else {
      return DateTime(year, month, day);
    }
  }

  @override
  String toString() {
    if (year == 0) {
      return DateTime(DateTime.now().year, DateTime.now().month).formatYear;
    } else if (month == 0) {
      return DateTime(year).formatY;
    } else if (day == 0) {
      return DateTime(year, month).formatYear;
    } else {
      return DateTime(year, month, day).formatDMY;
    }
  }

  TimeModel copyWith({
    int? day,
    int? month,
    int? year,
  }) {
    return TimeModel(
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }
}
