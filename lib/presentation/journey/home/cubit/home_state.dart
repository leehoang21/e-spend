part of 'home_cubit.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final List<TransactionModel> data;
  final HomeStateStatus status;

  const HomeState({
    this.data = const [],
    this.status = HomeStateStatus.initial,
  });

  HomeState copyWith({
    List<TransactionModel>? data,
    HomeStateStatus? status,
  }) {
    return HomeState(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [data, status];
}
