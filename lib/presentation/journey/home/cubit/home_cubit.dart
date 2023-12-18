import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/time_model.dart';
import 'package:flutter_e_spend/data/models/transaction_model.dart';
import 'package:flutter_e_spend/domain/use_cases/statistic_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/exception/app_error.dart';
import '../../../../data/models/statistics_model.dart';
import '../../../../domain/use_cases/transaction_use_case.dart';
import '../../../../domain/use_cases/user_use_case.dart';
import '../../../bloc/base_bloc/base_bloc.dart';
import '../../../widgets/change_time/time/time_cubit.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends BaseBloc<HomeState> {
  HomeCubit(
    this.useCase,
    this.userUseCase,
    this.statisticUseCase,
    this._timeCubit,
  ) : super(HomeState.initial());
  final TransactionUseCase useCase;
  final UserUseCase userUseCase;
  final StatisticUseCase statisticUseCase;
  final TimeCubit _timeCubit;
  StreamSubscription? _subscription;
  StreamSubscription? _statisticSubscription;
  StatisticsListModel _statistic = StatisticsListModel();
  final int _limit = 15;

  @override
  Future onInit() async {
    _subscription = useCase
        .stream(
          params: _params,
        )
        .listen(listen);
    _statisticSubscription = statisticUseCase.stream().listen(listenStatistic);
    super.onInit();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _statisticSubscription?.cancel();
    return super.close();
  }

  void listenStatistic(Either<StatisticsListModel, AppError> event) {
    event.fold(
      (left) {
        _statistic = left;
      },
      (right) {
        showSnackbar(translationKey: right.toString());
      },
    );
    changeStatistic();
    hideLoading();
  }

  changeStatistic() {
    final result = _timeCubit.changeStatistic(_statistic);
    emit(state.copyWith(
      statistic: (
        (result[CategoryType.revenue] ?? 0.0) +
            (result[CategoryType.debt] ?? 0.0),
        (result[CategoryType.expense] ?? 0.0) +
            (result[CategoryType.loan] ?? 0.0),
      ),
    ));
  }

  changeDate(TimeModel time) {
    changeStatistic();
    _subscription?.cancel();
    _subscription = useCase
        .stream(
          params: _params,
        )
        .listen(listen);
  }

  ParamsTransactionUsecase get _params {
    late final Timestamp toTime;
    late final Timestamp fromTime;
    final time = _timeCubit.state.time;
    if (time.year == 0) {
      fromTime = Timestamp.fromDate(DateTime.now().copyWith(
        day: 1,
        hour: 0,
        minute: 0,
        second: 0,
      ));
      toTime = Timestamp.fromDate(
        DateTime.now().copyWith(
          day: 1,
          month: DateTime.now().month + 1,
          hour: 0,
          minute: 0,
          second: 0,
        ),
      );
    } else if (time.month == 0) {
      fromTime = Timestamp.fromDate(DateTime.now().copyWith(
        day: 1,
        month: 1,
        hour: 0,
        minute: 0,
        second: 0,
      ));
      toTime = Timestamp.fromDate(
        DateTime.now().copyWith(
          day: 1,
          month: 1,
          year: DateTime.now().year + 1,
          hour: 0,
          minute: 0,
          second: 0,
        ),
      );
    } else if (time.day == 0) {
      fromTime = Timestamp.fromDate(DateTime.now().copyWith(
        day: 1,
        month: time.month,
        hour: 0,
        minute: 0,
        second: 0,
      ));
      toTime = Timestamp.fromDate(
        DateTime.now().copyWith(
          day: 1,
          month: time.month + 1,
          hour: 0,
          minute: 0,
          second: 0,
        ),
      );
    } else {
      fromTime = Timestamp.fromDate(DateTime.now().copyWith(
        day: time.day,
        month: time.month,
        hour: 0,
        minute: 0,
        second: 0,
      ));
      toTime = Timestamp.fromDate(
        DateTime.now().copyWith(
          day: time.day + 1,
          month: time.month,
          hour: 0,
          minute: 0,
          second: 0,
        ),
      );
    }
    return ParamsTransactionUsecase(
      toTime: toTime,
      fromTime: fromTime,
      documentSnapshot: state.lastDocument,
      limit: _limit,
    );
  }

  void get() async {
    final result = await useCase.get(params: _params);
    listen(result);
  }

  void listen(Either<List<TransactionModel>, AppError> result) {
    result.fold((l) {
      if (l.length < _limit) {
        emit(state.copyWith(
          lastDocument: null,
        ));
      } else {
        emit(state.copyWith(status: HomeStateStatus.loaded));
      }
      getData(l);
    }, (r) {
      showSnackbar(translationKey: r.message);
      emit(state.copyWith(
        lastDocument: null,
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
    emit(state.copyWith(data: result, status: HomeStateStatus.loaded));
  }
}
