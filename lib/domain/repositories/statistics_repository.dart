import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/data/models/statistics_model.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/transaction_model.dart';

abstract class StatisticsRepository {
  Future<Either<StatisticsListModel, AppError>> update(
    TransactionModel transaction, {
    TransactionModel? transactionOld,
  });
  Future<Either<StatisticsListModel, AppError>> get();
  Stream<Either<StatisticsListModel, AppError>> stream();
}
