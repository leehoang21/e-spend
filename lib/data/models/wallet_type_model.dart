import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_type_model.freezed.dart';

@freezed
class WalletTypeModel with _$WalletTypeModel {
  const factory WalletTypeModel({
    int? id,
    String? name,
  }) = _WalletTypeModel;
}
