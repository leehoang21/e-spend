import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/data/models/transaction_model.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../domain/use_cases/recurring_use_case.dart';

class RecurringListState extends Equatable {
  const RecurringListState();

  @override
  List<Object?> get props => [];
}

class RecurringListNoResult extends RecurringListState {}

class RecurringListLoading extends RecurringListState {}

class RecurringListLoaded extends RecurringListState {
  final List<TransactionModel> list;

  const RecurringListLoaded(this.list);

  @override
  List<Object?> get props => list;
}

class RecurringListError extends RecurringListState {
  final String error;

  const RecurringListError(this.error);

  @override
  List<Object?> get props => [error];
}

@injectable
class RecurringListCubit extends BaseBloc<RecurringListState> {
  final RecurringUseCase useCase;
  StreamSubscription? _subscription;

  RecurringListCubit(this.useCase) : super(RecurringListLoading());

  @override
  onInit() {
    getRecurringList();
  }

  Future<void> getRecurringList() async {
    emit(RecurringListLoading());
    _subscription = useCase.stream().listen((event) {
      final result = event;
      result.fold((l) {
        if (l.isEmpty) {
          emit(RecurringListNoResult());
        } else {
          emit(RecurringListLoaded(l));
        }
      }, (r) {
        emit(RecurringListError(r.toString()));
      });
    });
  }

  @override
  close() async {
    _subscription?.cancel();
    super.close();
  }
}
