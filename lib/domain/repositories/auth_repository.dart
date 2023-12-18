import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';

import '../../common/exception/app_error.dart';

abstract class AuthRepository {
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required Function(String, int?) codeSent,
    int? reSendToken,
  });
  Future<Either<UserModel, AppError>> loginPhoneNumber(
      String verificationId, String smsCode);
  Future<AppError?> signOut();

  Future<AppError?> register({
    required String email,
    required String password,
  });
  Future<Either<UserModel, AppError>> registerWithPassword({
    required String email,
    required String password,
  });

  Future<Either<UserModel, AppError>> login();
  Future<Either<UserModel, AppError>> loginWithPassword({
    required String userName,
    required String pass,
  });
  Future<Either<UserModel, AppError>> loginWithGoogle();
  Future<Either<UserModel, AppError>> loginWithFacebook();
  Future<Either<UserModel, AppError>> loginWithBiometric();
  Future<Either<UserModel, AppError>> registerWithBiometric({
    required String verificationId,
    required String smsCode,
  });

  Future<(String, String)> getEmailAndPassword();
}
