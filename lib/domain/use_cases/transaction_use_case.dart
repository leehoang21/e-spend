import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/domain/repositories/statistics_repository.dart';
import 'package:flutter_e_spend/domain/repositories/storage_repository.dart';
import 'package:flutter_e_spend/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../common/exception/app_error.dart';
import '../../data/models/transaction_model.dart';

@injectable
class TransactionUseCase {
  final TransactionRepository _remoteRepository;
  final StatisticsRepository _statisticsRepository;
  final StorageRepository storageRepository;

  TransactionUseCase(
    this._remoteRepository,
    this._statisticsRepository,
    this.storageRepository,
  );

  Future<Either<String, AppError>> create(TransactionModel transaction) async {
    return _remoteRepository.create(
      transaction,
      null,
      null,
    );
  }

  Future<AppError?> update(
    TransactionModel transaction, {
    required TransactionModel transactionOld,
  }) async {
    final result = await _remoteRepository.update(
      transaction,
      transactionOld: transactionOld,
    );
    if (result == null) {
      final result2 = await _statisticsRepository.update(transaction,
          transactionOld: transactionOld);
      return result2.fold((l) => null, (r) => r);
    }
    return result;
  }

  Future<AppError?> delete(TransactionModel transaction) async {
    final result = await _remoteRepository.delete(transaction);
    if (result == null) {
      final result2 = await _statisticsRepository.update(
          transaction.copyWith(
            amount: 0,
          ),
          transactionOld: transaction);
      return result2.fold((l) => null, (r) => r);
    }
    return result;
  }

  Stream<Either<List<TransactionModel>, AppError>> stream({
    required ParamsTransactionUsecase params,
  }) {
    return _remoteRepository.stream(
      toTime: params.toTime,
      fromTime: params.fromTime,
      limit: params.limit,
    );
  }

  Future<Either<List<TransactionModel>, AppError>> get({
    required ParamsTransactionUsecase params,
  }) async {
    final result = await _remoteRepository.get(
      toTime: params.toTime,
      fromTime: params.fromTime,
      documentSnapshot: params.documentSnapshot,
      limit: params.limit,
    );
    return result.fold(
      (left) async {
        final List<TransactionModel> list = [];
        for (final item in left) {
          if (item.id != null) {
            final photos = <String>[];
            for (int i = 0; i < (item.photos ?? []).length; i++) {
              final image = await _getImage(i, item.id!);
              if (image.isNotEmpty) {
                photos.add(image);
              }
            }
            list.add(item.copyWith(photos: photos));
          }
        }
        return Left(list);
      },
      (right) => Right(right),
    );
  }

  Future<String> _getImage(int index, String transactionId) async {
    try {
      final String storagePath =
          '${DefaultEnvironment.transaction}/$transactionId/$index.jpeg';
      final url = await storageRepository.downloadUrl(
        pathStorage: storagePath,
      );
      if (url.isLeft) {
        return url.left;
      }
      return '';
    } catch (e) {
      return '';
    }
  }
}

class ParamsTransactionUsecase {
  final Timestamp toTime;
  final Timestamp fromTime;
  final DocumentSnapshot<Object?>? documentSnapshot;
  final int limit;

  ParamsTransactionUsecase({
    required this.toTime,
    required this.fromTime,
    this.documentSnapshot,
    this.limit = 15,
  });

  factory ParamsTransactionUsecase.init() {
    return ParamsTransactionUsecase(
      toTime: Timestamp.fromDate(
        DateTime(DateTime.now().year + 3),
      ),
      fromTime: Timestamp.fromDate(
        DateTime(DateTime.now().year - 100),
      ),
      documentSnapshot: null,
    );
  }

  ParamsTransactionUsecase copyWith({
    Timestamp? toTime,
    Timestamp? fromTime,
    DocumentSnapshot<Object?>? documentSnapshot,
    int? limit,
  }) {
    return ParamsTransactionUsecase(
      toTime: toTime ?? this.toTime,
      fromTime: fromTime ?? this.fromTime,
      documentSnapshot: documentSnapshot,
      limit: limit ?? this.limit,
    );
  }
}
