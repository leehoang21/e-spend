import 'package:flutter_e_spend/common/constants/string_constants.dart';

class AppError implements Exception {
  final String message;
  final String? code;

  AppError({
    this.message = StringConstants.msgErrorUnknown,
    this.code,
  });

  @override
  String toString() {
    return message;
  }
}
