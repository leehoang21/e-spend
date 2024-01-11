import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/data/models/category_model.dart';
import 'package:flutter_e_spend/data/models/wallet_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction_model.dart';

part 'buget_model.freezed.dart';
part 'buget_model.g.dart';

@freezed
class BugetModel with _$BugetModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BugetModel({
    @Default([]) List<TransactionModel> transactions,
    WalletModel? wallet,
    CategoryModel? category,
    num? amount,
    DateTime? lastAt,
    DateTime? createAt,
    String? id,
    @Default(false) bool isAutoCreate,
  }) = _BugetModel;

  factory BugetModel.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> query) {
    final json = query.data();
    final id = query.id;
    final category = json['category'] as Map<String, dynamic>?;
    return BugetModel(
      id: id,
      amount: json['amount'] as num? ?? 0,
      category: category != null
          ? CategoryModel.fromJson(
              category,
            )
          : const CategoryModel(
              category: CategoryType.other,
            ),
      lastAt: json['lastAt'] != null ? DateTime.parse(json['lastAt']) : null,
      isAutoCreate: json['isAutoCreate'] as bool? ?? false,
      wallet: (json['wallet'] as Map<String, dynamic>?) != null
          ? WalletModel.fromJson(
              json['wallet'],
            )
          : WalletModel(),
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createAt:
          json['createAt'] != null ? DateTime.parse(json['createAt']) : null,
    );
  }

  factory BugetModel.fromJson(Map<String, dynamic> json) =>
      _$BugetModelFromJson(json);
}
