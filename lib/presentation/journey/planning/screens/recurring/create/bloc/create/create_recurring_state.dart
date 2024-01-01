import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../../common/enums/category.dart';
import '../../../../../../../../data/models/category_model.dart';
import '../../../../../../../../data/models/wallet_model.dart';

enum CreateRecurringStatus { initial, loading, succes, failed, noInternet }

class CreateRecurringState extends Equatable {
  final CreateRecurringStatus status;
  final Timestamp spendTime;
  final bool buttonIsValid;
  final num? amount;
  final CategoryModel? category;
  final List<String> photo;
  final WalletModel? wallet;
  final DateTime lastUpdate;
  const CreateRecurringState(
      {required this.status,
      required this.spendTime,
      required this.lastUpdate,
      required this.photo,
      this.buttonIsValid = false,
      this.amount,
      this.category,
      this.wallet});

  factory CreateRecurringState.initial() => CreateRecurringState(
        status: CreateRecurringStatus.initial,
        photo: const [],
        category: const CategoryModel(
          category: CategoryType.other,
          //subCategories: [],
        ),
        lastUpdate: DateTime.now(),
        spendTime: Timestamp.now(),
      );
  @override
  List<Object?> get props => [
        status,
        spendTime,
        buttonIsValid,
        amount,
        category,
        photo,
        wallet,
        lastUpdate,
      ];

  CreateRecurringState copyWith({
    CreateRecurringStatus? status,
    Timestamp? spendTime,
    bool? buttonIsValid,
    num? amount,
    CategoryModel? category,
    List<String>? photo,
    WalletModel? wallet,
    DateTime? lastUpdate,
  }) {
    return CreateRecurringState(
      status: status ?? this.status,
      spendTime: spendTime ?? this.spendTime,
      buttonIsValid: buttonIsValid ?? this.buttonIsValid,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      photo: photo ?? this.photo,
      wallet: wallet ?? this.wallet,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  @override
  String toString() {
    return 'CreateRecurringState(status: $status, spendTime: $spendTime, buttonIsValid: $buttonIsValid, amount: $amount, category: $category, wallet: $wallet)';
  }
}
