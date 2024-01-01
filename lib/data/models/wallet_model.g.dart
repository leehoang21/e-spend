// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      id: json['id'] as String?,
      walletImage: json['walletImage'] as String?,
      walletName: json['walletName'] as String?,
      balance: json['balance'] as num?,
      firstBalance: json['firstBalance'] as num?,
      walletType: json['walletType'] as int?,
      createAt: json['createAt'] as int?,
      lastUpdate: json['lastUpdate'] as int?,
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'walletImage': instance.walletImage,
      'walletName': instance.walletName,
      'balance': instance.balance,
      'firstBalance': instance.firstBalance,
      'walletType': instance.walletType,
      'createAt': instance.createAt,
      'lastUpdate': instance.lastUpdate,
    };
