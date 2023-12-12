import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/data/models/statistics_model.dart';
import 'package:injectable/injectable.dart';

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

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    showLoading();
    emit(state.copyWith(status: StatisticStateStatus.loading));
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
    hideLoading();
  }
}
