part of 'transaction_list_cubit.dart';

enum TransactionListStateStatus {
  loading,
  loaded,
}

class TransactionListState extends Equatable {
  final Map<String, List<TransactionModel>> data;
  final ParamsTransactionUsecase params;
  final CategoryType? categoryType;
  final TransactionListStateStatus status;

  const TransactionListState({
    this.data = const {},
    this.status = TransactionListStateStatus.loading,
    required this.params,
    this.categoryType,
  });

  factory TransactionListState.initial() => TransactionListState(
        status: TransactionListStateStatus.loading,
        // ignore: prefer_const_literals_to_create_immutables
        data: {},
        params: ParamsTransactionUsecase.init(),
      );

  TransactionListState copyWith({
    Map<String, List<TransactionModel>>? data,
    TransactionListStateStatus? status,
    ParamsTransactionUsecase? params,
    CategoryType? categoryType,
  }) {
    return TransactionListState(
      data: data ?? this.data,
      status: status ?? this.status,
      params: params ?? this.params,
      categoryType: categoryType ?? this.categoryType,
    );
  }

  @override
  List<Object?> get props => [
        data,
        status,
        params,
        categoryType,
      ];
}
