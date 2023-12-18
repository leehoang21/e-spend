import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/enums/category.dart';
import '../../../../data/models/statistics_model.dart';
import '../../../../data/models/time_model.dart';

part 'time_state.dart';

@singleton
class TimeCubit extends BaseBloc<TimeState> {
  TimeCubit() : super(TimeState.initial());

  changeTime(TimeModel time) {
    emit(state.copyWith(time: time));
  }

  Map<CategoryType, num> changeStatistic(StatisticsListModel statistic) {
    final time = state.time;
    late final Map<CategoryType, num> result;
    if (time.year == 0) {
      final data = statistic.subStatistics?[DateTime.now().month] ??
          StatisticsListModel();

      result = data.data;
    } else if (time.month == 0) {
      final data = statistic.data;

      result = data;
    } else if (time.day == 0) {
      final data =
          statistic.subStatistics?[time.month] ?? StatisticsListModel();

      result = data.data;
    } else {
      final data =
          statistic.subStatistics?[time.month]?.subStatistics?[time.day] ??
              StatisticsListModel();

      result = data.data;
    }
    return result;
  }
}
