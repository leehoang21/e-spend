import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/data/models/recurring_model.dart';
import 'package:injectable/injectable.dart';

import '../../common/exception/app_error.dart';
import '../repositories/recurring_repository.dart';

@injectable
class RecurringUseCase {
  final RecurringRepository _remoteRepository;

  RecurringUseCase(
    this._remoteRepository,
  );

  Future<Either<String, AppError>> put(
    RecurringModel data,
  ) async {
    return _remoteRepository.put(
      data,
    );
  }

  Future<AppError?> delete(String id) async {
    return _remoteRepository.delete(id);
  }

  Stream<Either<List<RecurringModel>, AppError>> stream() {
    return _remoteRepository.stream();
  }
}
