import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:injectable/injectable.dart';
import '../repositories/storage_repository.dart';

@injectable
class StorageUseCase {
  final StorageRepository storageRepository;

  StorageUseCase(this.storageRepository);

  Future<AppError?> put({
    required File imageToUpload,
    required String imagePathStorage,
  }) {
    return storageRepository.put(
      data: imageToUpload,
      pathStorage: imagePathStorage,
    );
  }

  Future<Either<String, AppError>> downUrl({
    required String imagePathStorage,
  }) async {
    return storageRepository.downloadUrl(
      pathStorage: imagePathStorage,
    );
  }
}
