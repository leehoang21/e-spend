import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_e_spend/domain/repositories/auth_repository.dart';
import 'package:flutter_e_spend/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/enums/login_type.dart';
import '../../common/exception/app_error.dart';

@injectable
class AuthUseCase {
  final AuthRepository repository;
  final UserRepository userRepository;
  final HiveConfig hiveConfig;
  AuthUseCase(
    this.hiveConfig, {
    required this.repository,
    required this.userRepository,
  });

  Future<AppError?> signOut() async {
    hiveConfig.setUser = null;
    return repository.signOut();
  }

  Future<AppError?> login({
    required LoginType loginType,
    String? userName,
    String? password,
  }) async {
    late final AppError? result;
    switch (loginType) {
      case LoginType.password:
        result = await repository.loginWithPassword(
          userName: userName!,
          pass: password!,
        );
        break;
      // case LoginType.google:
      //   result = await repository.loginWithGoogle();
      //   break;
      // case LoginType.facebook:
      //   result = await repository.loginWithFacebook();
      //   break;
      case LoginType.biometrics:
        result = await repository.loginWithBiometric();
        break;
      default:
        return AppError(message: 'login_type_not_support');
    }

    if (result == null) {
      final user = await userRepository.getUser();
      if (user != null) {
        hiveConfig.setUser = user;
      }
      if (user == null) {
        return AppError(message: 'error_message');
      }
      return null;
    }
    return result;
  }

  Future<AppError?> registerWithBiometric({
    required String password,
  }) async {
    return repository.registerWithBiometric(password: password);
  }

  Future<AppError?> register({
    required UserModel user,
    String? password,
  }) async {
    if (!isNullEmpty(user.email) || !isNullEmpty(password)) {
      final AppError? result = await repository.registerWithPassword(
        email: user.email ?? '',
        password: password ?? "",
      );
      if (result != null) {
        return result;
      }
      await userRepository.updateUser(user);
      return null;
    } else {
      return AppError(message: 'error_message');
    }
  }

  Future<AppError?> updatePassword({
    required String newPass,
    required String oldPass,
  }) async {
    final result = await repository.updatePassword(
      newPass: newPass,
      oldPass: oldPass,
    );
    return result;
  }
}
