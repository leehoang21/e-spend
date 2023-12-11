import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_info_model.freezed.dart';
part 'bank_info_model.g.dart';

@freezed
class BankInfoModel with _$BankInfoModel {
  const factory BankInfoModel({
    int? id,
    String? bin,
    String? code,
    int? isTransfer,
    String? shortName,
    String? logo,
    int? support,
    String? name,
  }) = _BankInfoModel;

  factory BankInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BankInfoModelFromJson(json);
}
