import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/data/models/statistics_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/enums/category.dart';
import '../../../../common/exception/app_error.dart';
import '../../../../domain/use_cases/statistic_use_case.dart';
import '../../../../domain/use_cases/user_use_case.dart';
import '../../../bloc/base_bloc/base_bloc.dart';
import '../../../widgets/change_time/time/time_cubit.dart';
part 'statistic_state.dart';

@injectable
class StatisticCubit extends BaseBloc<StatisticState> {
  StatisticCubit(this.useCase, this.userUseCase, this._timeCubit)
      : super(StatisticState.initial());
  final StatisticUseCase useCase;
  final UserUseCase userUseCase;
  StreamSubscription? _subscription;
  StatisticsListModel _statistic = StatisticsListModel();
  final TimeCubit _timeCubit;

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

  changeStatistic() {
    final data = _timeCubit.changeStatistic(_statistic);
    emit(state.copyWith(data: data));
  }

  void listen(Either<StatisticsListModel, AppError> event) {
    emit(state.copyWith(status: StatisticStateStatus.loading));
    final result = event;
    result.fold(
      (left) {
        _statistic = left;
        changeStatistic();
        emit(state.copyWith(status: StatisticStateStatus.loaded));
      },
      (right) {
        showSnackbar(translationKey: right.toString());

        emit(state.copyWith(status: StatisticStateStatus.error));
      },
    );
    hideLoading();
  }
}
