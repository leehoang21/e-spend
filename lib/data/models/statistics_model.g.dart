// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsListModelImpl _$$StatisticsListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatisticsListModelImpl(
      statistics: (json['statistics'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, StatisticsListModel.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      data: (json['data'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$StatisticsListModelImplToJson(
        _$StatisticsListModelImpl instance) =>
    <String, dynamic>{
      'statistics': instance.statistics,
      'data': instance.data,
    };
