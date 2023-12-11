import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/app_utils.dart';
import '../../../../data/models/transaction_model.dart';
import '../../../../domain/use_cases/transaction_use_case.dart';
import '../../../../domain/use_cases/user_use_case.dart';
import '../../../bloc/base_bloc/base_bloc.dart';
part 'statistic_state.dart';

@injectable
class StatisticCubit extends BaseBloc<StatisticState> {
  StatisticCubit(this.useCase, this.userUseCase)
      : super(const StatisticState());
  final TransactionUseCase useCase;
  final UserUseCase userUseCase;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    final result = await useCase.get();
    result.fold(
      (left) {
        emit(state.copyWith(data: left, status: StatisticStateStatus.loaded));
      },
      (right) {
        logger(right.toString());
        emit(state.copyWith(status: StatisticStateStatus.error));
      },
    );
  }

  double get _revenue {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      if (element.category.type != 'REVENUE') return previousValue;
      return previousValue + element.amount;
    });
  }

  double revenue(int index) {
    final data = state.data[index];
    return data.amount / _revenue;
  }

  double get _expense {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      if (element.category.type != 'EXPENSES') return previousValue;
      return previousValue + element.amount;
    });
  }

  double expense(int index) {
    final data = state.data[index];
    return data.amount / _expense;
  }

  String get total {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      return previousValue + element.amount;
    }).toString();
  }
}
