import 'package:flutter_e_spend/common/constants/string_constants.dart';

class AppError implements Exception {
  final String message;
  final String? code;
  final Exception? exception;

  AppError({
    this.message = StringConstants.msgErrorUnknown,
    this.code,
    this.exception,
  });

  @override
  String toString() {
    return message;
  }
}
