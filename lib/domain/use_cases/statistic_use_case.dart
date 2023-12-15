import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/domain/repositories/statistics_repository.dart';
import 'package:injectable/injectable.dart';
import '../../common/exception/app_error.dart';
import '../../data/models/statistics_model.dart';

@injectable
class StatisticUseCase {
  final StatisticsRepository _statisticsRepository;

  StatisticUseCase(this._statisticsRepository);

  Stream<Either<StatisticsListModel, AppError>> stream() {
    return _statisticsRepository.stream();
  }
}
