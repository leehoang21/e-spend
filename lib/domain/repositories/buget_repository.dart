import 'package:either_dart/either.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/buget_model.dart';

abstract class BugetRepository {
  Future<Either<String, AppError>> put(
    BugetModel data,
  );
  Future<AppError?> delete(String id);
  Stream<Either<List<BugetModel>, AppError>> stream();
  Future<Either<List<BugetModel>, AppError>> get();
}
