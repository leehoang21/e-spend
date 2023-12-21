import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/biometric/biometric_config.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
part 'buget_state.dart';

@injectable
class BugetCubit extends BaseBloc<BugetState> {
  BugetCubit(
    this.authUseCase,
    this.biometricConfig,
    this.hivec,
  ) : super(const BugetState());
  final AuthUseCase authUseCase;
  final BiometricConfig biometricConfig;
  final HiveConfig hivec;
}
