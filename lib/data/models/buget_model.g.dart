// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BugetModelImpl _$$BugetModelImplFromJson(Map<String, dynamic> json) =>
    _$BugetModelImpl(
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      wallet: json['wallet'] == null
          ? null
          : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      amount: json['amount'] as num?,
      lastAt: json['lastAt'] == null
          ? null
          : DateTime.parse(json['lastAt'] as String),
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      id: json['id'] as String?,
      isAutoCreate: json['isAutoCreate'] as bool? ?? false,
    );

Map<String, dynamic> _$$BugetModelImplToJson(_$BugetModelImpl instance) =>
    <String, dynamic>{
      'transactions': instance.transactions.map((e) => e.toJson()).toList(),
      'wallet': instance.wallet?.toJson(),
      'category': instance.category?.toJson(),
      'amount': instance.amount,
      'lastAt': instance.lastAt?.toIso8601String(),
      'createAt': instance.createAt?.toIso8601String(),
      'id': instance.id,
      'isAutoCreate': instance.isAutoCreate,
    };
