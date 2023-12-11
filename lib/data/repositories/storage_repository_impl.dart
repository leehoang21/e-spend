import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/storage_repository.dart';

@Injectable(as: StorageRepository)
class StorageRepositoryImpl extends StorageRepository {
  final FirebaseConfig config;

  String get _uId => HiveConfig().user?.uId ?? '';

  StorageRepositoryImpl(this.config);
  @override
  Future<AppError?> put({
    required File data,
    required String pathStorage,
  }) async {
    try {
      final Reference storageRef = config.userStorage.child(_uId + pathStorage);
      TaskSnapshot taskSnapshot = await storageRef.putFile(data);
      if (taskSnapshot.state == TaskState.success) {
        return null;
      }
      return AppError(message: 'Upload failed');
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  @override
  Future<Either<String, AppError>> downloadUrl({
    required String pathStorage,
  }) async {
    try {
      return Left(
          await config.userStorage.child(_uId + pathStorage).getDownloadURL());
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }
}
