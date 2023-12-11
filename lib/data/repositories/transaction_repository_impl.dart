import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../common/utils/app_utils.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../models/transaction_model.dart';

@Injectable(as: TransactionRepository)
class TransactionRepositoryImpl extends TransactionRepository {
  final FirebaseConfig firebaseConfig;
  final HiveConfig hiveConfig;
  final WalletRepository walletRepository;
  TransactionRepositoryImpl(
    this.firebaseConfig,
    this.hiveConfig,
    this.walletRepository,
  );

  String get _uid => hiveConfig.user?.uId ?? '';

  CollectionReference<Map<String, dynamic>> get _doc => firebaseConfig.userDoc
      .collection(_uid)
      .doc(DefaultEnvironment.customer)
      .collection(DefaultEnvironment.transaction);
  @override
  Future<Either<String, AppError>> create(TransactionModel transaction) async {
    try {
      final result = await _doc.add(transaction.toJson());
      await _changeWallet(transaction);
      return Left(result.id);
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<AppError?> update(
    TransactionModel transaction,
  ) async {
    try {
      await _doc.doc(transaction.id).update(
            transaction.toJson(),
          );
      await _changeWallet(transaction);
      return null;
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  Future<TransactionModel> _changeWallet(TransactionModel transaction) async {
    TransactionModel model = transaction;
    if (model.category.type == 'REVENUE') {
      model = model.copyWith(
        wallet: model.wallet.copyWith(
          balance: (model.wallet.balance ?? 0) + transaction.amount,
          lastUpdate: DateTime.now().millisecond,
        ),
      );
    } else {
      model = model.copyWith(
        wallet: model.wallet.copyWith(
          balance: (model.wallet.balance ?? 0) - transaction.amount,
          lastUpdate: DateTime.now().millisecond,
        ),
      );
    }
    await walletRepository.put(walletModel: model.wallet);
    return model;
  }

  @override
  Future<Either<List<TransactionModel>, AppError>> get() async {
    try {
      final result = await _doc.get();

      final data = result.docs.map(
        (e) {
          logger(e.data().toString());
          final data = e.data();
          return TransactionModel.fromJson(data, e.id);
        },
      ).toList();
      return Left(data);
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }
}
