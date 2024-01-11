import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:flutter_e_spend/domain/repositories/storage_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../domain/repositories/buget_repository.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../models/buget_model.dart';

@Injectable(as: BugetRepository)
class BugetRepositoryImpl extends BugetRepository {
  final FirebaseConfig firebaseConfig;
  final WalletRepository walletRepository;
  final StorageRepository storageRepository;
  BugetRepositoryImpl(
    this.walletRepository,
    this.storageRepository,
    this.firebaseConfig,
  );

  String get _uid => firebaseConfig.auth.currentUser?.uid ?? '';

  CollectionReference<Map<String, dynamic>> get _doc {
    return firebaseConfig.userDoc
        .collection(_uid)
        .doc(DefaultEnvironment.customer)
        .collection(DefaultEnvironment.buget);
  }

  @override
  Future<Either<String, AppError>> put(
    BugetModel data,
  ) async {
    try {
      final param = data.toJson();
      if (data.id == null) {
        final result = await (_doc).add(param);
        return Left(result.id);
      } else {
        await _doc.doc(data.id).update(param);
        return Left(data.id ?? '');
      }
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<AppError?> delete(String id) async {
    try {
      await _doc.doc(id).delete();

      return null;
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  Future<BugetModel> _get(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    return BugetModel.fromDocument(element);
  }

  @override
  Stream<Either<List<BugetModel>, AppError>> stream() async* {
    try {
      final result = _doc
          .snapshots()
          .map<Future<Either<List<BugetModel>, AppError>>>((event) async {
        try {
          final data = <BugetModel>[];
          for (var element in event.docs) {
            final result = await _get(element);
            data.add(result);
          }
          return Left(data);
        } catch (e) {
          return Right(AppError(message: e.toString()));
        }
      });
      yield* result.asyncMap((event) => event);
    } catch (e) {
      yield* Stream.value(Right(AppError(message: e.toString())));
    }
  }

  @override
  Future<Either<List<BugetModel>, AppError>> get() async {
    try {
      final result = await _doc.get();
      final data = <BugetModel>[];
      for (var element in result.docs) {
        final result = await _get(element);
        data.add(result);
      }
      return Left(data);
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }
}
