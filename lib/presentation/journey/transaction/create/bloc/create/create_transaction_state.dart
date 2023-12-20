import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../common/enums/category.dart';
import '../../../../../../data/models/category_model.dart';
import '../../../../../../data/models/wallet_model.dart';

enum CreateTransactionStatus { initial, loading, succes, failed, noInternet }

class CreateTransactionState extends Equatable {
  final CreateTransactionStatus status;
  final Timestamp spendTime;
  final bool buttonIsValid;
  final int? amount;
  final CategoryModel? category;
  final List<String> photo;
  final WalletModel? wallet;
  final DateTime lastUpdate;
  const CreateTransactionState(
      {required this.status,
      required this.spendTime,
      required this.lastUpdate,
      required this.photo,
      this.buttonIsValid = false,
      this.amount,
      this.category,
      this.wallet});

  factory CreateTransactionState.initial() => CreateTransactionState(
        status: CreateTransactionStatus.initial,
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

  CreateTransactionState copyWith({
    CreateTransactionStatus? status,
    Timestamp? spendTime,
    bool? buttonIsValid,
    int? amount,
    CategoryModel? category,
    List<String>? photo,
    WalletModel? wallet,
    DateTime? lastUpdate,
  }) {
    return CreateTransactionState(
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
    return 'CreateTransactionState(status: $status, spendTime: $spendTime, buttonIsValid: $buttonIsValid, amount: $amount, category: $category, wallet: $wallet)';
  }
}
