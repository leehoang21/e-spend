import 'package:equatable/equatable.dart';
import '../../../../../data/models/transaction_model.dart';
import '../../../../bloc/base_bloc/base_bloc.dart';

part 'detail_transaction_state.dart';

class DetailTransactionBloc extends BaseBloc<DetailTransactionState> {
  DetailTransactionBloc() : super(DetailTransactionState.initial());

  init(TransactionModel data) async {
    emit(state.copyWith(data: data));
  }
}
