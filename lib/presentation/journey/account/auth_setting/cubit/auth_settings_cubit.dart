import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/biometric/biometric_config.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../common/enums/login_type.dart';
import '../../../../routers/app_router.dart';

part 'auth_settings_state.dart';

@injectable
class AuthSettingsCubit extends BaseBloc<AuthSettingsState> {
  AuthSettingsCubit(
    this.hiveConfig,
    this.authUseCase,
    this.biometricConfig,
  ) : super(AuthSettingsState.initial());

  final HiveConfig hiveConfig;
  final BiometricConfig biometricConfig;
  final AuthUseCase authUseCase;
  @override
  onInit() {
    _isLocalAuth();
  }

  Future<void> linkSocial({
    required LoginType loginType,
  }) async {
    final result = await push(
      VerifyOtpRoute(
        phoneNumber: hiveConfig.user!.phoneNumber!,
        loginType: loginType,
      ),
    );

    if (result == false) {
      showSnackbar(
        translationKey: 'link_social_fail',
      );
      return;
    }
  }

  authBiometric() async {
    final isAuth = await biometricConfig.canAuthenticateBiometric;

    if (isAuth) {
      linkSocial(loginType: LoginType.biometrics);
    } else {
      final result = await biometricConfig.registerBiometric;
      if (result) {
        linkSocial(loginType: LoginType.biometrics);
      }
    }
  }

  Future<void> _isLocalAuth() async {
    final result = await biometricConfig.canCheckBiometrics;
    emit(state.copyWith(isLocalAuth: result));
  }

  Future<void> loginWithPassword(bool enabled) async {
    await push(RegisterLoginWithPasswordRoute(
      enabled: enabled,
    ));
  }

  updatePassword({
    required String newPass,
    required String oldPass,
  }) async {
    await authUseCase.updatePassword(newPass: newPass, oldPass: oldPass);
  }
}
