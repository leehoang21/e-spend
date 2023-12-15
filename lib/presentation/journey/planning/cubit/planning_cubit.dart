import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';

part 'planning_state.dart';

@injectable
class PlanningCubit extends BaseBloc<PlanningState> {
  PlanningCubit() : super(PlanningState.initial());
}
