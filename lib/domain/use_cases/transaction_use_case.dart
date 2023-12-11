import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/domain/repositories/statistics_repository.dart';
import 'package:flutter_e_spend/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/transaction_model.dart';

@injectable
class TransactionUseCase {
  final TransactionRepository _remoteRepository;
  final StatisticsRepository _statisticsRepository;

  TransactionUseCase(this._remoteRepository, this._statisticsRepository);

  Future<Either<String, AppError>> create(TransactionModel transaction) async {
    return await _remoteRepository.create(transaction);
  }

  Future<AppError?> update(
    TransactionModel transaction, {
    TransactionModel? transactionOld,
  }) async {
    final result = await _remoteRepository.update(transaction);
    if (result == null) {
      final result2 = await _statisticsRepository.update(transaction,
          transactionOld: transactionOld);
      return result2.fold((l) => null, (r) => r);
    }
    return result;
  }

  Future<Either<List<TransactionModel>, AppError>> get() async {
    return await _remoteRepository.get();
  }
}
