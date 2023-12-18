import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/transaction_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/models/transaction_model.dart';
import '../../../../bloc/base_bloc/base_bloc.dart';

part 'detail_transaction_state.dart';

@injectable
class DetailTransactionBloc extends BaseBloc<DetailTransactionState> {
  DetailTransactionBloc(this._transactionUseCase)
      : super(DetailTransactionState.initial());
  final TransactionUseCase _transactionUseCase;

  init(TransactionModel data) async {
    emit(state.copyWith(data: data));
  }

  Future<void> delete() async {
    final result = await _transactionUseCase.delete(state.data);
    if (result != null) {
      showSnackbar(translationKey: result.message);
    } else {
      await pop(null);
    }
  }
}
