import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
    required Timestamp spendTime,
    List<String>? photos,
    required WalletModel wallet,
    required int createAt,
    required int lastUpdate,
    DocumentSnapshot? documentSnapshot,
  }) = _TransactionModel;

  const TransactionModel._();

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      note: json['note'] as String?,
      category: (json['category'] as Map<String, dynamic>?) != null
          ? CategoryModel.fromJson(
              json['category'] as Map<String, dynamic>,
            )
          : const CategoryModel(
              category: CategoryType.other,
            ),
      spendTime: json['spendTime'] as Timestamp? ?? Timestamp.now(),
      photos:
          (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
      wallet: (json['wallet'] as Map<String, dynamic>?) != null
          ? WalletModel.fromJson(
              json['wallet'],
            )
          : WalletModel(),
      createAt: json['createAt'] as int? ?? 0,
      lastUpdate: json['lastUpdate'] as int? ?? 0,
      documentSnapshot: null,
    );
  }

  static TransactionModel fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> query) {
    final json = query.data();
    final id = query.id;

    return TransactionModel(
      id: id,
      amount: json['amount'] as int? ?? 0,
      note: json['note'] as String?,
      category: (json['category'] as Map<String, dynamic>?) != null
          ? CategoryModel.fromJson(
              json['category'] as Map<String, dynamic>,
            )
          : const CategoryModel(
              category: CategoryType.other,
            ),
      spendTime: json['spendTime'] as Timestamp? ?? Timestamp.now(),
      photos:
          (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
      wallet: (json['wallet'] as Map<String, dynamic>?) != null
          ? WalletModel.fromJson(
              json['wallet'],
            )
          : WalletModel(),
      createAt: json['createAt'] as int? ?? 0,
      lastUpdate: json['lastUpdate'] as int? ?? 0,
      documentSnapshot: query,
    );
  }

  factory TransactionModel.empty() => TransactionModel(
        amount: 0,
        category: const CategoryModel(
          category: CategoryType.other,
        ),
        spendTime: Timestamp.now(),
        wallet: WalletModel(),
        createAt: 0,
        lastUpdate: 0,
      );

  String get time {
    final date = DateTime.now();
    final dateItem = spendTime.toDate();
    if (dateItem.day == date.day &&
        dateItem.month == date.month &&
        dateItem.year == date.year) {
      return 'Today';
    } else if (dateItem.day == date.day - 1 &&
        dateItem.month == date.month &&
        dateItem.year == date.year) {
      return 'Yesterday';
    } else {
      return spendTime.formatDateMonth;
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
