import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/common/utils/format_utils.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/constants/string_constants.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends BaseBloc<LoginState> {
  LoginCubit(this.authUseCase, this.hiveConfig) : super(const LoginState());
  final AuthUseCase authUseCase;
  final HiveConfig hiveConfig;

  loginWithPhone(String phone) {
    push(VerifyOtpRoute(phoneNumber: phone, loginType: LoginType.phone));
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
        //xác minh bước 2
        if (hiveConfig.localAuth) {
          final isLocalAuth = await authUseCase.localAuth();
          if (!isLocalAuth) {
            showSnackbar(
              translationKey: StringConstants.localAuthFail,
            );
            hideLoading();
            return;
          }
        }
        //
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
    final email = formatPhoneToEmail(phone);
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
