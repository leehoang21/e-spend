// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsModelImpl _$$StatisticsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatisticsModelImpl(
      revenue: (json['revenue'] as num).toDouble(),
      expense: (json['expense'] as num).toDouble(),
      loan: (json['loan'] as num).toDouble(),
      debt: (json['debt'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatisticsModelImplToJson(
        _$StatisticsModelImpl instance) =>
    <String, dynamic>{
      'revenue': instance.revenue,
      'expense': instance.expense,
      'loan': instance.loan,
      'debt': instance.debt,
    };
