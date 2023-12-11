import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/data/models/statistics_model.dart';
import 'package:injectable/injectable.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/repositories/statistics_repository.dart';

@Injectable(as: StatisticsRepository)
class StatisticsRepositoryImpl implements StatisticsRepository {
  @override
  Future<Either<StatisticsListModel, AppError>> update(
    TransactionModel transaction, {
    TransactionModel? transactionOld,
  }) async {
    try {
      return const Left(StatisticsListModel());
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<List<TransactionModel>, AppError>> get() async {
    try {
      return const Left([]);
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }
}
