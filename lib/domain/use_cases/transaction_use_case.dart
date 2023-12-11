import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/transaction_model.dart';

@injectable
class TransactionUseCase {
  final TransactionRepository _remoteRepository;

  TransactionUseCase(this._remoteRepository);

  Future<Either<String, AppError>> create(TransactionModel transaction) async {
    return await _remoteRepository.create(transaction);
  }

  Future<AppError?> update(TransactionModel transaction) async {
    return await _remoteRepository.update(transaction);
  }

  Future<Either<List<TransactionModel>, AppError>> get() async {
    return await _remoteRepository.get();
  }
}
