import 'package:dio/dio.dart';

class BaseResponse<T> {
  final int? code;
  final T? data;
  final String? message;
  final bool? result;
  final String? errorCode;

  Response? dioResponse;

  BaseResponse({
    this.code,
    this.data,
    this.message,
    this.result,
    this.errorCode,
  });
}
