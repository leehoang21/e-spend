import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/notification/notification_config.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:notifications/notifications.dart';

import '../../../../data/models/recurring_model.dart';
import '../../../../domain/use_cases/recurring_use_case.dart';

class RecurringListState extends Equatable {
  const RecurringListState();

  @override
  List<Object?> get props => [];
}

class RecurringListNoResult extends RecurringListState {}

class RecurringListLoading extends RecurringListState {}

class RecurringListLoaded extends RecurringListState {
  final List<RecurringModel> list;

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

@singleton
class RecurringListCubit extends BaseBloc<RecurringListState> {
  final RecurringUseCase useCase;
  StreamSubscription? _subscription;
  final NotificationConfig notificationConfig;

  RecurringListCubit(this.useCase, this.notificationConfig)
      : super(RecurringListLoading());

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
          emit(const RecurringListLoaded([]));
        } else {
          emit(RecurringListLoaded(l));
          handel(l);
        }
      }, (r) {
        emit(RecurringListError(r.toString()));
      });
    });
  }

  handel(List<RecurringModel> data) {
    for (var item in data) {
      notificationConfig.schedule(
        NotificationEvent(
          message: item.note,
          title: item.category!.title.tr,
          packageName: 'com.schedule',
          timeStamp: item.repeat?.nextTime ?? DateTime.now(),
        ),
      );
    }
  }

  @override
  close() async {
    _subscription?.cancel();
    super.close();
  }
}
