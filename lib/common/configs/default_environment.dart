import 'package:flutter/foundation.dart';

class DefaultEnvironment {
  static const String bankHost = 'https://api.vietqr.io';
  static const String environmentHome = 'e-spend';
  static const String environment = kDebugMode ? 'develop' : 'release';
  static const String customer = 'customer';
  static const String category = 'category';
  static const String transaction = 'transaction';
  static const String statistics = 'statistics';
  static const String walletList = 'wallet';
  static const String avatar = 'avatar.jpeg';
  static const String user = 'user';
  static const String recurring = 'recurring';
  //local
  static const String lang = 'lang';
  static const String theme = 'theme';
  static const String localAuth = 'localAuth';
}
