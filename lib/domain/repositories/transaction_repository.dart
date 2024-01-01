import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<Either<String, AppError>> create(
    TransactionModel transaction,
    String? id,
    String? walletId,
  );
  Future<AppError?> update(
    TransactionModel transaction, {
    required TransactionModel transactionOld,
  });
  Future<AppError?> delete(TransactionModel transaction);
  Future<Either<List<TransactionModel>, AppError>> get({
    required Timestamp toTime,
    required Timestamp fromTime,
    required DocumentSnapshot<Object?>? documentSnapshot,
    required int limit,
  });
  Stream<Either<List<TransactionModel>, AppError>> stream({
    required Timestamp toTime,
    required Timestamp fromTime,
    required int limit,
  });
}
