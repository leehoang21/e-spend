import 'package:either_dart/either.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<Either<String, AppError>> create(TransactionModel transaction);
  Future<AppError?> update(TransactionModel transaction);
  Future<Either<List<TransactionModel>, AppError>> get();
}
