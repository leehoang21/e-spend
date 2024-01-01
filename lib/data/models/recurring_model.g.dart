// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecurringModelImpl _$$RecurringModelImplFromJson(Map<String, dynamic> json) =>
    _$RecurringModelImpl(
      transaction: TransactionModel.fromJson(
          json['transaction'] as Map<String, dynamic>),
      startDate: DateTime.parse(json['startDate'] as String),
      recurringType: json['recurringType'] as String,
      recurringCount: json['recurringCount'] as int,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$RecurringModelImplToJson(
        _$RecurringModelImpl instance) =>
    <String, dynamic>{
      'transaction': instance.transaction.toJson(),
      'startDate': instance.startDate.toIso8601String(),
      'recurringType': instance.recurringType,
      'recurringCount': instance.recurringCount,
      'id': instance.id,
    };
