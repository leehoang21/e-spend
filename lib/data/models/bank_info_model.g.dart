// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankInfoModelImpl _$$BankInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$BankInfoModelImpl(
      id: json['id'] as int?,
      bin: json['bin'] as String?,
      code: json['code'] as String?,
      isTransfer: json['isTransfer'] as int?,
      shortName: json['shortName'] as String?,
      logo: json['logo'] as String?,
      support: json['support'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$BankInfoModelImplToJson(_$BankInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bin': instance.bin,
      'code': instance.code,
      'isTransfer': instance.isTransfer,
      'shortName': instance.shortName,
      'logo': instance.logo,
      'support': instance.support,
      'name': instance.name,
    };
