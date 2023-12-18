import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/transaction_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../common/exception/app_error.dart';
import '../../../../../domain/use_cases/transaction_use_case.dart';
import '../../../../bloc/base_bloc/base_bloc.dart';

part 'transaction_list_state.dart';

@injectable
class TransactionListCubit extends BaseBloc<TransactionListState> {
  TransactionListCubit(
    this.useCase,
  ) : super(TransactionListState.initial());
  final TransactionUseCase useCase;
  StreamSubscription? _subscription;

  @override
  Future onInit() async {
    _subscription = useCase.stream(params: state.params).listen(listen);
    super.onInit();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  void changeParams(
    ParamsTransactionUsecase params,
    CategoryType? type,
  ) {
    emit(
      TransactionListState(
        params: params,
        categoryType: type,
        status: TransactionListStateStatus.loading,
      ),
    );

    _subscription?.cancel();
    _subscription = useCase.stream(params: state.params).listen(listen);
  }

  void get() async {
    final result = await useCase.get(params: state.params);
    listen(result);
  }

  void listen(Either<List<TransactionModel>, AppError> result) {
    result.fold((l) {
      if (l.length < state.params.limit) {
        emit(state.copyWith(
          params: state.params.copyWith(
            documentSnapshot: null,
          ),
        ));
      } else {
        emit(state.copyWith(status: TransactionListStateStatus.loaded));
      }
      getData(l);
    }, (r) {
      showSnackbar(translationKey: r.message);
      emit(state.copyWith(
        params: state.params.copyWith(
          documentSnapshot: null,
        ),
      ));
    });
  }

  void getData(List<TransactionModel> data) {
    Map<String, List<TransactionModel>> result = {};
    for (final item in data) {
      final dateItem = DateTime.now().difference(item.spendTime.toDate());
      if (dateItem.inHours < 24 &&
          DateTime.now().day == item.spendTime.toDate().day) {
        result['Today'.tr] = [...result['Today'.tr] ?? [], item];
      } else if (dateItem.inHours < 48 &&
          DateTime.now().day - 1 == item.spendTime.toDate().day) {
        result['Yesterday'.tr] = [...result['Yesterday'.tr] ?? [], item];
      } else {
        final timeString = item.spendTime.formatDateMonth;
        result[timeString] = [...result[timeString] ?? [], item];
      }
    }
    if (state.categoryType != null) {
      result = result.map((key, value) => MapEntry(
          key,
          value
              .where(
                  (element) => element.category.category == state.categoryType)
              .toList()));
      final data =
          result.entries.where((element) => element.value.isNotEmpty).toList();
      result = Map.fromEntries(data);
    }
    emit(
      state.copyWith(
        data: result,
        status: TransactionListStateStatus.loaded,
      ),
    );
  }
}
