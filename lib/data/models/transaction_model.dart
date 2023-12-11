import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/utils/format_utils.dart';
import 'category_model.dart';
import 'wallet_model.dart';

part 'transaction_model.freezed.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    String? id,
    required int amount,
    String? note,
    required CategoryModel category,
    required int spendTime,
    List<String>? photos,
    required WalletModel wallet,
    required int createAt,
    required int lastUpdate,
  }) = _TransactionModel;

  const TransactionModel._();

  static TransactionModel fromJson(Map<String, dynamic> json, String id) =>
      TransactionModel(
        id: id,
        amount: json['amount'] as int? ?? 0,
        note: json['note'] as String?,
        category: (json['category'] as Map<String, dynamic>?) != null
            ? CategoryModel.fromJson(
                json['category'] as Map<String, dynamic>,
              )
            : const CategoryModel(),
        spendTime: json['spendTime'] as int? ?? 0,
        photos:
            (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
        wallet: (json['wallet'] as Map<String, dynamic>?) != null
            ? WalletModel.fromJson(
                json['wallet'],
                '',
              )
            : WalletModel(),
        createAt: json['createAt'] as int? ?? 0,
        lastUpdate: json['lastUpdate'] as int? ?? 0,
      );

  factory TransactionModel.empty() => TransactionModel(
        amount: 0,
        category: const CategoryModel(),
        spendTime: 0,
        wallet: WalletModel(),
        createAt: 0,
        lastUpdate: 0,
      );

  String get time {
    final date = DateTime.now();
    final dateItem = DateTime.fromMillisecondsSinceEpoch(spendTime);
    if (dateItem.day == date.day &&
        dateItem.month == date.month &&
        dateItem.year == date.year) {
      return 'Today';
    } else if (dateItem.day == date.day - 1 &&
        dateItem.month == date.month &&
        dateItem.year == date.year) {
      return 'Yesterday';
    } else {
      return formatDateMonth(DateTime.fromMillisecondsSinceEpoch(spendTime));
    }
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'note': note,
        'category': category.toJson(),
        'spendTime': spendTime,
        'photo': photos,
        'wallet': wallet.toJson(),
        'createAt': createAt,
        'lastUpdate': lastUpdate,
      };
}