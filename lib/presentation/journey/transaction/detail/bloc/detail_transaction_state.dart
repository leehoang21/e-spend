part of 'detail_transaction_bloc.dart';

class DetailTransactionState extends Equatable {
  final TransactionModel data;
  const DetailTransactionState({
    required this.data,
  });

  factory DetailTransactionState.initial() => DetailTransactionState(
        data: TransactionModel.empty(),
      );
  @override
  List<Object?> get props => [data];

  DetailTransactionState copyWith({
    TransactionModel? data,
  }) {
    return DetailTransactionState(
      data: data ?? this.data,
    );
  }
}
