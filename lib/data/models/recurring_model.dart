import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'wallet_model.dart';

part 'recurring_model.freezed.dart';
part 'recurring_model.g.dart';

enum RepeatType {
  none,
  daily,
  weekly,
  monthly,
  yearly,
}

extension RepeatTypeExtension on RepeatType {
  String get title {
    switch (this) {
      case RepeatType.none:
        return 'recurring.create.none';
      case RepeatType.daily:
        return 'recurring.create.day';
      case RepeatType.weekly:
        return 'recurring.create.week';
      case RepeatType.monthly:
        return 'recurring.create.month';
      case RepeatType.yearly:
        return 'recurring.create.year';
    }
  }

  String get type {
    switch (this) {
      case RepeatType.none:
        return 'none';
      case RepeatType.daily:
        return 'day';
      case RepeatType.weekly:
        return 'week';
      case RepeatType.monthly:
        return 'month';
      case RepeatType.yearly:
        return 'year';
    }
  }
}

RepeatType repeatTypeFromString(String value) {
  switch (value) {
    case 'RepeatType.daily':
    case "recurring.create.day":
      return RepeatType.daily;
    case 'RepeatType.weekly':
    case "recurring.create.week":
      return RepeatType.weekly;
    case 'RepeatType.monthly':
    case "recurring.create.month":
      return RepeatType.monthly;
    case 'RepeatType.yearly':
    case "recurring.create.year":
      return RepeatType.yearly;
    default:
      return RepeatType.none;
  }
}

@freezed
class Repeat with _$Repeat {
  const factory Repeat({
    int? length,
    DateTime? startTime,
    RepeatType? type,
  }) = _Repeat;
  const Repeat._();
  factory Repeat.fromJson(Map<String, dynamic> json) => _$RepeatFromJson(json);

  DateTime get nextTime {
    switch (type) {
      case RepeatType.daily:
        DateTime time = startTime ?? DateTime.now();
        while (time.isBefore(DateTime.now())) {
          time = time.add(Duration(days: length ?? 10));
        }
        return time;
      case RepeatType.weekly:
        DateTime time = startTime ?? DateTime.now();
        while (time.isBefore(DateTime.now())) {
          time = time.add(Duration(days: (length ?? 1) * 7));
        }
        return time;

      case RepeatType.monthly:
        DateTime time = startTime ?? DateTime.now();
        while (time.isBefore(DateTime.now())) {
          //tăng 1 tháng
          if (time.month == 12) {
            time = time.copyWith(year: time.year + 1, month: 1);
          } else {
            time = time.copyWith(month: time.month + 1);
            DateTime(time.year, time.month + 1, time.day);
          }
        }
        return time;

      case RepeatType.yearly:
        DateTime time = startTime ?? DateTime.now();
        while (time.isBefore(DateTime.now())) {
          time = time.copyWith(year: time.year + (length ?? 1));
        }
        return time;

      default:
        return DateTime.now();
    }
  }
}

@freezed
class RecurringModel with _$RecurringModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RecurringModel({
    String? id,
    CategoryType? category,
    DateTime? createAt,
    String? note,
    int? defaultAmount,
    Repeat? repeat,
    WalletModel? wallet,
  }) = _RecurringModel;

  const RecurringModel._();

  factory RecurringModel.fromJson(Map<String, dynamic> json) =>
      _$RecurringModelFromJson(json);

  static RecurringModel fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> query) {
    final json = query.data();
    final id = query.id;
    final model = RecurringModel.fromJson(json);
    return model.copyWith(id: id);
  }
}
