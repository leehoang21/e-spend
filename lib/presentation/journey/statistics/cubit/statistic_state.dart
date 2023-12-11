part of 'statistic_cubit.dart';

enum StatisticStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class StatisticState extends Equatable {
  final List<TransactionModel> data;
  final StatisticStateStatus status;

  const StatisticState({
    this.data = const [],
    this.status = StatisticStateStatus.initial,
  });

  StatisticState copyWith({
    List<TransactionModel>? data,
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
