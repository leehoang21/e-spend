import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/data/models/category_model.dart';
import 'package:flutter_e_spend/data/models/wallet_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction_model.dart';

part 'buget_model.freezed.dart';

@freezed
class BugetModel with _$BugetModel {
  const factory BugetModel({
    List<TransactionModel>? transactions,
    WalletModel? wallet,
    CategoryModel? category,
    double? amount,
    DateTime? time,
    String? id,
    @Default(false) bool isAutoCreate,
  }) = _BugetModel;

  factory BugetModel.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> query) {
    final json = query.data();
    final id = query.id;

    return BugetModel(
      id: id,
      amount: json['amount'] as double? ?? 0,
      category: (json['category'] as Map<String, dynamic>?) != null
          ? CategoryModel.fromJson(
              json['categoryType'] as Map<String, dynamic>,
            )
          : const CategoryModel(
              category: CategoryType.other,
            ),
      time: json['time'] != null ? DateTime.parse(json['time']) : null,
      isAutoCreate: json['isAutoCreate'] as bool? ?? false,
      wallet: (json['wallet'] as Map<String, dynamic>?) != null
          ? WalletModel.fromJson(
              json['wallet'],
            )
          : WalletModel(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
