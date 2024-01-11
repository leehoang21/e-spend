import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../data/models/buget_model.dart';
import '../../../../../../../../domain/use_cases/buget_use_case.dart';
part 'buget_state.dart';

@injectable
class BugetCubit extends BaseBloc<BugetState> {
  BugetCubit(
    this.authUseCase,
  ) : super(const BugetState());
  final BugetUseCase authUseCase;
  StreamSubscription? _subscription;

  @override
  void onInit() {
    super.onInit();
    _subscription = authUseCase.stream().listen((event) {
      event.fold(
        (l) => emit(state.copyWith(bugets: l)),
        (r) {
          showSnackbar(
            translationKey: r.message,
          );
        },
      );
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
