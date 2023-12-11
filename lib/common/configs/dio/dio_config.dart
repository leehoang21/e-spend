import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../enums/app_enums.dart';
import '../../utils/app_utils.dart';
import 'base_response.dart';

@lazySingleton
class DioApiClient {
  static const contentType = 'Content-Type';
  static const contentTypeJson = 'application/json; charset=utf-8';
  static const Duration _defaultTimeout = Duration(seconds: 60);
  static final BaseOptions defaultOptions = BaseOptions(
    connectTimeout: _defaultTimeout,
    sendTimeout: _defaultTimeout,
    receiveTimeout: _defaultTimeout,
    responseType: ResponseType.json,
  );

  Dio _dio = Dio();

  static final Map<BaseOptions, DioApiClient> _instanceMap = {};

  factory DioApiClient({BaseOptions? options}) {
    options ??= defaultOptions;
    if (_instanceMap.containsKey(options)) {
      return _instanceMap[options] ?? DioApiClient();
    }
    final DioApiClient apiClient = DioApiClient._create(options: options);
    _instanceMap[options] = apiClient;
    return apiClient;
  }

  DioApiClient._create({BaseOptions? options}) {
    options ??= defaultOptions;
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  static DioApiClient get instance => DioApiClient();

  Future<BaseResponse> request(
      {String? url,
      NetworkMethod method = NetworkMethod.post,
      String? data,
      Function? fromJsonModel,
      Map<String, dynamic>? formData,
      Map<String, dynamic>? queryParameters,
      String? basicAuthen,
      bool getFullResponse = false}) async {
    if (isNullEmpty(url)) {
      logger('!!!!!!EMPTY URL!!!!!! - data: $data');
    }
    Map<String, dynamic> headerMap = {};
    headerMap.putIfAbsent("accept", () => "*/*");
    Response response;
    try {
      var strMethod = _getMethod(method);
      response = await _dio.request(url ?? '',
          data: formData != null
              ? FormData.fromMap(formData)
              : data ?? jsonEncode({}),
          options: Options(
              method: strMethod,
              sendTimeout: _defaultTimeout,
              receiveTimeout: _defaultTimeout,
              headers: headerMap,
              contentType: formData != null ? 'multipart/form-data' : null),
          queryParameters: queryParameters);
      if (_isSuccessful(response.statusCode ?? -1)) {
        dynamic dataResult = response.data;
        return BaseResponse(
          result: true,
          data: dataResult,
          message: '',
          code: 1000,
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        dynamic dataResultError = e.response!.data;
        String errorMessage = dataResultError != null &&
                dataResultError.runtimeType.toString().contains('Map') &&
                !isNullEmpty(dataResultError['message'])
            ? dataResultError['message']
            : !isNullEmpty(e.response?.statusMessage)
                ? e.response?.statusMessage
                : e.message;
        String errorCode = dataResultError != null &&
                dataResultError.runtimeType.toString().contains('Map') &&
                !isNullEmpty(dataResultError['error'])
            ? dataResultError['error']
            : !isNullEmpty(e.response?.statusMessage)
                ? e.response?.statusMessage
                : e.message;
        return BaseResponse(
          result: false,
          data: dataResultError,
          message: errorMessage,
          code: e.response?.statusCode,
          errorCode: errorCode,
        );
      }
      if (e.error is SocketException) {
        SocketException socketException = e.error as SocketException;
        return BaseResponse(
          result: false,
          data: null,
          message: socketException.osError?.message ?? "",
          code: socketException.osError?.errorCode ?? 0,
        );
      }
      return BaseResponse(
        result: false,
        data: null,
        message: e.error != null ? e.error.toString() : "",
        code: -9999,
      );
    }
    throw ('Request NOT successful');
  }

  bool _isSuccessful(int i) {
    return i >= 200 && i <= 299;
  }

  String _getMethod(NetworkMethod method) {
    switch (method) {
      case NetworkMethod.get:
        return 'GET';
      case NetworkMethod.post:
        return 'POST';
      case NetworkMethod.delete:
        return 'DELETE';
      case NetworkMethod.path:
        return 'PATH';
      case NetworkMethod.put:
        return 'PUT';
      default:
        return 'GET';
    }
  }
}
