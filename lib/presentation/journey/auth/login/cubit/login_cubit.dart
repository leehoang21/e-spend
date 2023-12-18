import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/biometric/biometric_config.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends BaseBloc<LoginState> {
  LoginCubit(
    this.authUseCase,
    this.biometricConfig,
  ) : super(const LoginState());
  final AuthUseCase authUseCase;
  final BiometricConfig biometricConfig;

  loginWithPhone(String phone) {
    push(VerifyOtpRoute(phoneNumber: phone, loginType: LoginType.phone));
  }

  @override
  onInit() {
    super.onInit();
    canAuthBiometric();
  }

  void canAuthBiometric() async {
    final result = await biometricConfig.canAuthenticateBiometric;
    emit(state.copyWith(canAuthBiometric: result));
  }

  loginWithBiometric() async {
    showLoading();
    final result = await authUseCase.loginWithBiometric();
    result.fold(
      (user) async {
        pushAndRemoveUntil(
          const MainRoute(),
          predicate: (route) => false,
        );
      },
      (error) {
        showSnackbar(translationKey: error.message);
      },
    );
    hideLoading();
  }

  checkLoginPassword() {
    emit(state.copyWith(isObscurePassword: !state.isObscurePassword));
  }

  loginWithSocial(
    LoginType loginType,
  ) async {
    showLoading();
    final result = await authUseCase.login(loginType: loginType);
    result.fold(
      (user) async {
        pushAndRemoveUntil(
          const MainRoute(),
          predicate: (route) => false,
        );
      },
      (error) {
        showSnackbar(translationKey: error.message);
      },
    );
    hideLoading();
  }

  loginWithPassword(String phone, String password) async {
    final email = phone.formatPhoneToEmail;
    showLoading();
    final result = await authUseCase.login(
      loginType: LoginType.password,
      userName: email,
      password: password,
    );
    result.fold(
      (user) {
        pushAndRemoveUntil(
          const MainRoute(),
          predicate: (route) => false,
        );
      },
      (error) {
        showSnackbar(translationKey: error.message);
      },
    );
    hideLoading();
  }
}
