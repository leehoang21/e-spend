import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/data/models/transaction_model.dart';

import '../../common/exception/app_error.dart';

abstract class RecurringRepository {
  Future<Either<String, AppError>> put(
    TransactionModel data,
  );
  Future<AppError?> delete(String id);
  Stream<Either<List<TransactionModel>, AppError>> stream();
}
