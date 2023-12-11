import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';

class AuthMapper {
  static UserModel convertUserCredentialToUserModel(
      UserCredential userCredential) {
    return UserModel(
      phoneNumber: userCredential.user?.phoneNumber ?? '',
      uId: userCredential.user?.uid,
      avatar: userCredential.user?.photoURL,
      email: userCredential.user?.email,
      userName: userCredential.user?.displayName ?? '',
    );
  }
}
