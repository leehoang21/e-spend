import 'package:either_dart/either.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/recurring_model.dart';

abstract class RecurringRepository {
  Future<Either<String, AppError>> put(
    RecurringModel data,
  );
  Future<AppError?> delete(String id);
  Stream<Either<List<RecurringModel>, AppError>> stream();
}
