import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_spend/common/configs/biometric/biometric_config.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_e_spend/data/mapper/auth_mapper.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final FirebaseConfig config;
  final HiveConfig hiveConfig;
  final BiometricConfig biometricConfig;
  AuthRepositoryImpl(
    this.hiveConfig,
    this.config,
    this.biometricConfig,
  );

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
  Future<AppError?> registerWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      password = hash(password);

      await config.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      return AppError(message: e.message ?? e.code);
    } catch (e) {
      return AppError(message: e.toString());
    }
    return null;
  }

  @override
  Future<AppError?> login(String token) async {
    try {
      await config.auth.signInWithCustomToken(token);
    } on FirebaseException catch (e) {
      return AppError(message: e.message ?? e.code);
    } catch (e) {
      return AppError(message: e.toString());
    }
    return null;
  }

  @override
  Future<AppError?> loginWithPassword({
    required String userName,
    required String pass,
  }) async {
    try {
      pass = hash(pass);
      final credential = EmailAuthProvider.credential(
        email: userName,
        password: pass,
      );
      if (config.auth.currentUser != null) {
        await config.auth.currentUser?.reauthenticateWithCredential(credential);
      } else {
        await config.auth.signInWithCredential(credential);
      }
    } on FirebaseException catch (e) {
      return AppError(message: e.message ?? e.code);
    } catch (e) {
      return AppError(message: 'password_or_email_incorrect');
    }
    return null;
  }

  @override
  Future<AppError?> updatePassword({
    required String newPass,
    required String oldPass,
  }) async {
    try {
      final userCredential = await config.auth.signInWithEmailAndPassword(
        email: (hiveConfig.user?.phoneNumber ?? '').formatPhoneToEmail,
        password: oldPass,
      );
      final user = userCredential.user;
      await user?.updatePassword(newPass);
    } on FirebaseException catch (e) {
      return AppError(message: e.message ?? e.code);
    } catch (e) {
      return AppError(message: e.toString());
    }
    return null;
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
    } on FirebaseException catch (e) {
      return Right(AppError(message: e.message ?? e.code));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
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
    } on FirebaseException catch (e) {
      return Right(AppError(message: e.message ?? e.code));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<AppError?> registerWithBiometric({
    required String password,
  }) async {
    try {
      final email = hiveConfig.user?.email ?? '';
      //reauth
      await loginWithPassword(userName: email, pass: password);
      hiveConfig.setLocalAuthId = config.auth.currentUser?.uid ?? "";
      return biometricConfig.saveUser(email, password);
    } on FirebaseException catch (e) {
      return AppError(message: e.message ?? e.code);
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  @override
  Future<AppError?> loginWithBiometric() async {
    try {
      final canAuth = await biometricConfig.canAuthenticateBiometric;
      if (canAuth) {
        final (email, password) = await biometricConfig.user ?? ('', '');
        if (isNullEmpty(email) && isNullEmpty(password)) {
          return AppError(message: 'auth_fail');
        } else {
          return loginWithPassword(
            userName: email.toString(),
            pass: password,
          );
        }
      }
      return AppError(message: 'biometrics_auth_fail'.tr);
    } on FirebaseException catch (e) {
      return AppError(message: e.message ?? e.code);
    } catch (e) {
      return AppError(message: e.toString());
    }
  }
}
