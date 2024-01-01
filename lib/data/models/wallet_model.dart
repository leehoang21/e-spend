import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  factory WalletModel({
    String? id,
    String? walletImage,
    String? walletName,
    num? balance,
    num? firstBalance,
    int? walletType,
    int? createAt,
    int? lastUpdate,
  }) = _WalletModel;

  WalletModel._();

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  static WalletModel fromDocument(Map<String, dynamic> data, String id) =>
      WalletModel(
        id: id,
        walletImage: data['walletImage']
            as String?, // ignore: cast_nullable_to_non_nullable
        walletName: data['walletName'] as String?,
        balance: data['balance'] as int?,
        walletType: data['walletType'] as int?,
        createAt: data['createAt'] as int?,
        lastUpdate: data['lastUpdate'] as int?,
        firstBalance: data['firstBalance'] as int?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'walletImage': walletImage,
        'walletName': walletName,
        'balance': balance,
        'walletType': walletType,
        'createAt': createAt,
        'lastUpdate': lastUpdate,
        'firstBalance': firstBalance,
      };
}
