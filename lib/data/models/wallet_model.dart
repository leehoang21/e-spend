import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';

@freezed
class WalletModel with _$WalletModel {
  factory WalletModel({
    String? id,
    String? walletImage,
    String? walletName,
    int? balance,
    int? walletType,
    int? createAt,
    int? lastUpdate,
  }) = _WalletModel;

  WalletModel._();

  static WalletModel fromJson(Map<String, dynamic> data, String id) =>
      WalletModel(
        id: id,
        walletImage: data['walletImage']
            as String?, // ignore: cast_nullable_to_non_nullable
        walletName: data['walletName'] as String?,
        balance: data['balance'] as int?,
        walletType: data['walletType'] as int?,
        createAt: data['createAt'] as int?,
        lastUpdate: data['lastUpdate'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'walletImage': walletImage,
        'walletName': walletName,
        'balance': balance,
        'walletType': walletType,
        'createAt': createAt,
        'lastUpdate': lastUpdate,
      };
}
