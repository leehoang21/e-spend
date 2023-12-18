import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_locker/flutter_locker.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'biometric_box_name.dart';

@singleton
class BiometricConfig {
  late final LocalAuthentication _auth;

  @postConstruct
  init() async {
    _auth = LocalAuthentication();
  }

  RetrieveSecretRequest _retrieveSecretRequest(String key) {
    return RetrieveSecretRequest(
      key: key,
      androidPrompt: _androidPrompt,
      iOsPrompt: _iOsPrompt,
    );
  }

  SaveSecretRequest _saveSecretRequest(String key, String secret) {
    return SaveSecretRequest(
      key: key,
      secret: secret,
      androidPrompt: _androidPrompt,
    );
  }

  AndroidPrompt get _androidPrompt => AndroidPrompt(
        cancelLabel: "cancel".tr,
        title: "auth".tr,
        descriptionLabel: "please_auth".tr,
      );

  IOsPrompt get _iOsPrompt => IOsPrompt(
        touchIdText: 'please_auth'.tr,
      );

  Future<(String, String)?> get user async {
    try {
      final email = await FlutterLocker.retrieve(
        _retrieveSecretRequest(
          BiometricBoxName.email,
        ),
      );
      final password = await FlutterLocker.retrieve(
        _retrieveSecretRequest(BiometricBoxName.password),
      );
      return (email, password);
    } catch (e) {
      logger(e);
      return null;
    }
  }

  Future<bool> get canCheckBiometrics async {
    try {
      return _auth.canCheckBiometrics;
    } catch (e) {
      logger(e);
      return false;
    }
  }

  Future<bool> get canAuthenticateBiometric async {
    try {
      final result = await FlutterLocker.canAuthenticate();
      return result ?? false;
    } catch (e) {
      logger(e);
      return false;
    }
  }

  Future<bool> get registerBiometric async {
    try {
      return _auth.authenticate(
        localizedReason: "please_auth".tr,
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
        authMessages: [
          AndroidAuthMessages(
            signInTitle: 'auth'.tr,
            cancelButton: 'cancel'.tr,
            biometricHint: 'please_auth'.tr,
            goToSettingsDescription: "goToSettingsDescription".tr,
            goToSettingsButton: "goToSettingsButton".tr,
            biometricRequiredTitle: "biometricRequiredTitle".tr,
            biometricNotRecognized: "biometricNotRecognized".tr,
            biometricSuccess: "biometricSuccess".tr,
          ),
          IOSAuthMessages(
            cancelButton: 'cancel'.tr,
          ),
        ],
      );
    } catch (e) {
      return false;
    }
  }

  Future<AppError?> saveUser(String email, String password) async {
    try {
      await FlutterLocker.save(
        _saveSecretRequest(BiometricBoxName.email, email),
      );
      await FlutterLocker.save(
        _saveSecretRequest(BiometricBoxName.password, password),
      );
    } catch (e) {
      logger(e);
      return AppError(message: 'auth_fail');
    }
    return null;
  }
}
