import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';

abstract class StorageRepository {
  Future<AppError?> put({
    required File data,
    required String pathStorage,
  });

  Future<Either<String, AppError>> downloadUrl({
    required String pathStorage,
  });
}
