import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';

import '../../common/exception/app_error.dart';

abstract class AuthRepository {
  Future<AppError?> signOut();
  Future<AppError?> registerWithPassword({
    required String email,
    required String password,
  });
  Future<AppError?> login(String token);
  Future<AppError?> loginWithPassword({
    required String userName,
    required String pass,
  });
  Future<AppError?> updatePassword({
    required String newPass,
    required String oldPass,
  });
  Future<Either<UserModel, AppError>> loginWithGoogle();
  Future<Either<UserModel, AppError>> loginWithFacebook();
  Future<AppError?> loginWithBiometric();
  Future<AppError?> registerWithBiometric({
    required String password,
  });
}
