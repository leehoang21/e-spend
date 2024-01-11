import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/buget_model.dart';
import '../repositories/buget_repository.dart';

@injectable
class BugetUseCase {
  final BugetRepository _remoteRepository;

  BugetUseCase(
    this._remoteRepository,
  );

  Future<Either<String, AppError>> put(BugetModel data) async {
    return _remoteRepository.put(data);
  }

  Future<AppError?> delete(String id) async {
    return _remoteRepository.delete(id);
  }

  Stream<Either<List<BugetModel>, AppError>> stream() {
    return _remoteRepository.stream();
  }
}
