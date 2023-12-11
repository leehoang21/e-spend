import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_e_spend/data/mapper/auth_mapper.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import '../../common/configs/default_environment.dart';
import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final FirebaseConfig config;
  final HiveConfig hiveConfig;
  final LocalAuthentication auth;
  AuthRepositoryImpl(
    this.hiveConfig,
    this.config,
    this.auth,
  );

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required Function(String, int?) codeSent,
    int? reSendToken,
  }) async {
    await config.auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (verificationId) {},
      forceResendingToken: reSendToken,
    );
  }

  @override
  Future<Either<UserModel, AppError>> loginPhoneNumber(
    String verificationId,
    String smsCode,
  ) async {
    try {
      final userCredential = await config.auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        ),
      );

      return Left(AuthMapper.convertUserCredentialToUserModel(userCredential));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<AppError?> signOut() async {
    try {
      await config.googleSignIn.signOut();
    } catch (_) {}
    try {
      await config.facebookAuth.logOut();
    } catch (_) {}
    try {
      await config.auth.signOut();
      return null;
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  @override
  Future<AppError?> register({
    required String email,
    required String password,
  }) async {
    try {
      await config.userDoc
          .collection(config.auth.currentUser?.uid ?? '')
          .doc(DefaultEnvironment.customer)
          .set({
        'email': email,
        'password': password,
      });
      return null;
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  @override
  Future<Either<UserModel, AppError>> registerWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await config.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Left(AuthMapper.convertUserCredentialToUserModel(userCredential));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<(String, String)> getEmailAndPassword() async {
    try {
      final json = await config.userDoc
          .collection(config.auth.currentUser!.uid)
          .doc(DefaultEnvironment.customer)
          .get();
      final email = json.data()?['email'];
      final password = json.data()?['password'];
      return (email.toString(), password.toString());
    } catch (e) {
      return ('', '');
    }
  }

  @override
  Future<Either<UserModel, AppError>> login() async {
    try {
      final (email, password) = await getEmailAndPassword();
      if (!isNullEmpty(email) && !isNullEmpty(password)) {
        return loginWithPassword(
          userName: email.toString(),
          pass: password.toString(),
        );
      }
      return Right(AppError(message: StringConstants.accountNotExits));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<UserModel, AppError>> loginWithPassword({
    required String userName,
    required String pass,
  }) async {
    try {
      final UserCredential userCredential =
          await config.auth.signInWithEmailAndPassword(
        email: userName,
        password: pass,
      );
      return Left(AuthMapper.convertUserCredentialToUserModel(userCredential));
    } catch (e) {
      return Right(AppError(message: 'password_or_email_incorrect'));
    }
  }

  @override
  Future<Either<UserModel, AppError>> loginWithFacebook() async {
    try {
      final LoginResult result = await config.facebookAuth.login();
      final token = result.accessToken;

      if (token == null) {
        return Right(AppError(message: 'login_failed'));
      }

      await config.auth.signInWithCredential(
        FacebookAuthProvider.credential(
          token.token,
        ),
      );
      final user = await config.facebookAuth.getUserData();

      return Left(UserModel.fromJson(user));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<bool> localAuth() async {
    final result = await auth.authenticate(
        localizedReason: 'Vplease_auth_local'.tr,
        options: const AuthenticationOptions(biometricOnly: true));
    hiveConfig.setLocalAuth(result);
    return result;
  }

  @override
  Future<Either<UserModel, AppError>> loginWithGoogle() async {
    try {
      //nếu chưa login thì login rồi lấy token
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await config.googleSignIn.signIn();

      // Obtain the auth details from the request
      final token = await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: token?.accessToken,
        idToken: token?.idToken,
      );

      // Once signed in, return the UserCredential
      final user = await FirebaseAuth.instance.signInWithCredential(credential);
      return Left(AuthMapper.convertUserCredentialToUserModel(user));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<bool> verifyEmail() async {
    try {
      await config.auth.currentUser?.sendEmailVerification();
      return true;
    } catch (e) {
      return false;
    }
  }
}
