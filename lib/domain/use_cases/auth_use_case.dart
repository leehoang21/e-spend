import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  AuthUseCase({
    required this.repository,
    required this.userRepository,
  });

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required Function(String, int?) codeSent,
    int? reSendToken,
  }) async {
    await repository.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationFailed: verificationFailed,
      verificationCompleted: verificationCompleted,
      codeSent: codeSent,
      reSendToken: reSendToken,
    );
  }

  Future<AppError?> signOut() async {
    return repository.signOut();
  }

  Future<Either<UserModel, AppError>> login({
    required LoginType loginType,
    String? userName,
    String? password,
  }) async {
    late final Either<UserModel, AppError> result;
    switch (loginType) {
      case LoginType.phone:
        result = await repository.loginPhoneNumber(userName!, password!);
        break;
      case LoginType.password:
        result = await repository.loginWithPassword(
          userName: userName!,
          pass: password!,
        );
        break;

      case LoginType.google:
        result = await repository.loginWithGoogle();
        break;
      case LoginType.facebook:
        result = await repository.loginWithFacebook();
        break;
      default:
        return Right(AppError(message: 'login_type_not_support'));
    }

    if (result.isLeft) {
      final data = await repository.login();
      final user = await userRepository.getUser();
      if (user != null) {
        await userRepository.updateUserLocal(user);
      }
      return data;
    }
    return Right(result.right);
  }

  Future<Either<UserModel, AppError>> register({
    required LoginType loginType,
    required String verificationId,
    required String smsCode,
    (String email, String password)? emailAndPassword,
  }) async {
    late final String email;
    late final String pass;
    UserModel? user;
    switch (loginType) {
      case LoginType.phone:
        (email, pass) = await genEmailAndPassword();
        final error = await repository.register(
          email: email,
          password: pass,
        );
        if (error != null) {
          return Right(error);
        }
        final result =
            await repository.registerWithPassword(email: email, password: pass);
        if (result.isRight) {
          return Right(result.right);
        }
        return repository.login();
      case LoginType.password:
        final result =
            await repository.loginPhoneNumber(verificationId, smsCode);

        if (result.isLeft) {
          (email, pass) = await repository.getEmailAndPassword();
          if (emailAndPassword == null) {
            return Right(AppError(message: 'error_message'));
          }
          final results2 = await repository.registerWithPassword(
            email: emailAndPassword.$1,
            password: emailAndPassword.$2,
          );

          if (results2.isLeft) {
            break;
          } else {
            return Right(results2.right);
          }
        }
        return Right(result.right);

      case LoginType.google:
        final result =
            await repository.loginPhoneNumber(verificationId, smsCode);
        //get email and password
        (email, pass) = await repository.getEmailAndPassword();
        if (result.isLeft) {
          final results2 = await repository.loginWithGoogle();
          if (results2.isLeft) {
            //update user info
            final u = await userRepository.getUser();
            if (u != null) {
              user = u.copyWith(
                googleLink: results2.left,
              );
            }

            break;
          } else {
            return Right(results2.right);
          }
        }
        return Right(result.right);
      case LoginType.facebook:
        final result =
            await repository.loginPhoneNumber(verificationId, smsCode);
        //get email and password
        (email, pass) = await repository.getEmailAndPassword();
        if (result.isLeft) {
          final results2 = await repository.loginWithFacebook();
          if (results2.isLeft) {
            //update user info
            //update user info
            final u = await userRepository.getUser();
            if (u != null) {
              user = u.copyWith(
                facebookLink: results2.left,
              );
            }

            break;
          } else {
            return Right(results2.right);
          }
        }
        return Right(result.right);

      default:
        return Right(AppError(message: 'login_type_not_support'));
    }
    final error = await repository.register(
      email: email,
      password: pass,
    );
    if (error != null) {
      return Right(error);
    }
    final data = await repository.login();
    if (user != null) {
      await userRepository.updateUser(user);
    }
    return data;
  }

  Future<(String, String)> genEmailAndPassword() async {
    final rd = Random.secure().nextInt(1000000);
    final rdEmail = '${Random.secure().nextInt(1000000)}';
    final rdPass = '${Random.secure().nextInt(1000000)}';
    final key = utf8.encode(rd.toString());
    final emailBytes = utf8.encode(rdEmail);
    final passBytes = utf8.encode(rdPass);
    final Timestamp timestamp = Timestamp.now();
    final hmacSha256 = Hmac(sha512256, key); // HMAC-SHA256
    final email =
        'H${hmacSha256.convert(emailBytes)}${timestamp.microsecondsSinceEpoch}@gmail.com';
    final pass =
        '${hmacSha256.convert(passBytes)}${timestamp.microsecondsSinceEpoch}';
    return (email, pass);
  }

  Future<bool> localAuth() {
    return repository.localAuth();
  }
}
