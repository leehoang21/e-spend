import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';

import '../../data/models/category_model.dart';
import '../../data/models/wallet_model.dart';

class AppValidator {
  static const String _validatePhone = r'0\d{12,}';
  static const String _validateEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  //Mật khẩu phải có ít nhất 8 ký tự, trong đó có ít nhất 1 chữ cái viết hoa, 1 chữ cái viết thường và 1 số,1 ký tự đặc biệt
  static const String _validatePassword =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$';
  static RegExp expPhoneNumber = RegExp(_validatePhone);
  static RegExp expPassword = RegExp(_validatePassword);

  static RegExp expEmail = RegExp(_validateEmail);

  static bool validateCreateTransactionButton(int? amount,
          CategoryModel? category, Timestamp? spendTime, WalletModel? wallet) =>
      amount != null &&
      amount != 0 &&
      category != null &&
      spendTime != null &&
      wallet != null;

  static String? validatePassword(String? password) {
    if (password == null ||
        password.isEmpty ||
        !expPassword.hasMatch(password)) {
      return 'invalid_password'.tr;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty || !expEmail.hasMatch(email)) {
      return 'invalid_email'.tr;
    }
    return null;
  }

  static String? validateUseName(String? userName) {
    if (isNullEmpty(userName)) {
      return 'user_empty'.tr;
    }
    return null;
  }
}
