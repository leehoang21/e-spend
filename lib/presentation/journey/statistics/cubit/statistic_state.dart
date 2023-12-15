part of 'statistic_cubit.dart';

enum StatisticStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class StatisticState extends Equatable {
  final StatisticsListModel data;
  final StatisticStateStatus status;

  const StatisticState({
    required this.data,
    this.status = StatisticStateStatus.initial,
  });

  factory StatisticState.initial() {
    return StatisticState(
      data: StatisticsListModel(
        data: {},
        subStatistics: {},
      ),
      status: StatisticStateStatus.initial,
    );
  }

  StatisticState copyWith({
    StatisticsListModel? data,
    StatisticStateStatus? status,
  }) {
    return StatisticState(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [data, status];
}
