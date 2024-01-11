import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/biometric/biometric_config.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/domain/use_cases/recurring_use_case.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:root/root.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends BaseBloc<LoginState> {
  LoginCubit(
    this.authUseCase,
    this.biometricConfig,
    this.hivec,
    this.firebaseConfig,
    this.recurringUseCase,
  ) : super(const LoginState(biometricType: BiometricType.weak));
  final AuthUseCase authUseCase;
  final BiometricConfig biometricConfig;
  final HiveConfig hivec;
  final FirebaseConfig firebaseConfig;
  final RecurringUseCase recurringUseCase;

  @override
  onInit() async {
    showLoading();
    super.onInit();
    await canAuthBiometric();
    await canCheckBiometricsSupport();
    await checkRoot();
    await _checkLogin();
    hideLoading();
  }

  Future<void> checkRoot() async {
    bool? result = await Root.isRooted();
    if (result != true) {
      await pop(result);
    }
  }

  Future _checkLogin() async {
    final result = await firebaseConfig.singIn();
    if (result) {
      pushAndRemoveUntil(
        const MainRoute(),
        predicate: (route) => false,
      );
    }
  }

  Future canAuthBiometric() async {
    final result = await biometricConfig.canAuthenticateBiometric;
    emit(state.copyWith(canAuthBiometric: result));
  }

  Future canCheckBiometricsSupport() async {
    final result = await biometricConfig.biometricType();
    emit(state.copyWith(biometricType: result));
  }

  loginWithOther(
    LoginType loginType,
  ) async {
    showLoading();
    try {
      final result = await authUseCase.login(
        loginType: loginType,
      );
      if (result != null) {
        showSnackbar(translationKey: result.message);
      } else {
        pushAndRemoveUntil(
          const MainRoute(),
          predicate: (route) => false,
        );
      }
    } catch (e) {
      showSnackbar(translationKey: 'error_message');
    }
    hideLoading();
  }

  login(
    String email,
    String password,
  ) async {
    showLoading();
    final result = await authUseCase.login(
      loginType: LoginType.password,
      userName: email,
      password: password,
    );
    if (result == null) {
      pushAndRemoveUntil(
        const MainRoute(),
        predicate: (route) => false,
      );
    } else {
      showSnackbar(translationKey: result.message);
    }

    hideLoading();
  }
}
