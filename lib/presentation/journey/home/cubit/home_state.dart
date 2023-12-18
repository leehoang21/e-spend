part of 'home_cubit.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
}

class HomeState extends Equatable {
  final Map<String, List<TransactionModel>> data;
  final (num, num) statistic;
  final HomeStateStatus status;
  final DocumentSnapshot<Object?>? lastDocument;

  const HomeState({
    required this.data,
    this.status = HomeStateStatus.initial,
    required this.statistic,
    this.lastDocument,
  });

  factory HomeState.initial() => const HomeState(
        status: HomeStateStatus.initial,
        // ignore: prefer_const_literals_to_create_immutables
        data: {},
        statistic: (0, 0),
      );

  HomeState copyWith({
    Map<String, List<TransactionModel>>? data,
    HomeStateStatus? status,
    ParamsTransactionUsecase? params,
    (num, num)? statistic,
    DocumentSnapshot<Object?>? lastDocument,
  }) {
    return HomeState(
      data: data ?? this.data,
      status: status ?? this.status,
      statistic: statistic ?? this.statistic,
      lastDocument: lastDocument,
    );
  }

  @override
  List<Object?> get props => [
        data,
        status,
        statistic,
        lastDocument,
      ];
}
