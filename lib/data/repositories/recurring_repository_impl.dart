import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:flutter_e_spend/domain/repositories/storage_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../domain/repositories/recurring_repository.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../models/recurring_model.dart';

@Injectable(as: RecurringRepository)
class RecurringRepositoryImpl extends RecurringRepository {
  final FirebaseConfig firebaseConfig;
  final WalletRepository walletRepository;
  final StorageRepository storageRepository;
  RecurringRepositoryImpl(
    this.walletRepository,
    this.storageRepository,
    this.firebaseConfig,
  );

  String get _uid => firebaseConfig.auth.currentUser?.uid ?? '';

  CollectionReference<Map<String, dynamic>> get _doc {
    return firebaseConfig.userDoc
        .collection(_uid)
        .doc(DefaultEnvironment.customer)
        .collection(DefaultEnvironment.recurring);
  }

  @override
  Future<Either<String, AppError>> put(
    RecurringModel data,
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

  Future<RecurringModel> _get(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    return RecurringModel.fromDocument(element);
  }

  @override
  Stream<Either<List<RecurringModel>, AppError>> stream() async* {
    try {
      final firebaseConfig0 = FirebaseConfig();
      await firebaseConfig0.initAsync();
      //lấy giao dịch trong khoản thời gian time
      final result = firebaseConfig0.userDoc
          .collection(_uid)
          .doc(DefaultEnvironment.customer)
          .collection(DefaultEnvironment.recurring)
          .snapshots()
          .map<Future<Either<List<RecurringModel>, AppError>>>((event) async {
        try {
          final data = <RecurringModel>[];
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
}
