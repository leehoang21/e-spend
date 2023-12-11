// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      name: json['name'] as String?,
      type: json['type'] as String?,
      createAt: json['createAt'] as int?,
      lastUpdate: json['lastUpdate'] as int?,
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'createAt': instance.createAt,
      'lastUpdate': instance.lastUpdate,
      'subCategories': instance.subCategories,
    };
