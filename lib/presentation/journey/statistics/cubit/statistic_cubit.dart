import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/data/models/statistics_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/exception/app_error.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../../domain/use_cases/statistic_use_case.dart';
import '../../../../domain/use_cases/user_use_case.dart';
import '../../../bloc/base_bloc/base_bloc.dart';
part 'statistic_state.dart';

@injectable
class StatisticCubit extends BaseBloc<StatisticState> {
  StatisticCubit(this.useCase, this.userUseCase)
      : super(StatisticState.initial());
  final StatisticUseCase useCase;
  final UserUseCase userUseCase;
  StreamSubscription? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  @override
  Future onInit() async {
    showLoading();

    _subscription?.cancel();
    _subscription = useCase.stream().listen(listen);
    hideLoading();
    super.onInit();
  }

  void listen(Either<StatisticsListModel, AppError> event) {
    emit(state.copyWith(status: StatisticStateStatus.loading));
    final result = event;
    result.fold(
      (left) {
        emit(state.copyWith(data: left, status: StatisticStateStatus.loaded));
        hideLoading();
      },
      (right) {
        hideLoading();
        logger(right.toString());
        showSnackbar(translationKey: right.toString());
        emit(state.copyWith(status: StatisticStateStatus.error));
      },
    );
  }
}
