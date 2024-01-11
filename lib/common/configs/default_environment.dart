import 'package:flutter/foundation.dart';

class DefaultEnvironment {
  static const String bankHost = 'https://api.vietqr.io';
  static const String notificationHost =
      'https://fcm.googleapis.com/v1/projects/espend-b9ba9/messages:send';
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
  static const String fcmToken = 'fcmToken';
  static const String buget = 'buget';
  //local
  static const String lang = 'lang';
  static const String theme = 'theme';
  static const String localAuth = 'localAuth';
}
