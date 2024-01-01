import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:flutter_e_spend/data/models/transaction_model.dart';
import 'package:flutter_e_spend/domain/repositories/storage_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../domain/repositories/recurring_repository.dart';
import '../../domain/repositories/wallet_repository.dart';

@Injectable(as: RecurringRepository)
class RecurringRepositoryImpl extends RecurringRepository {
  final FirebaseConfig firebaseConfig;
  final WalletRepository walletRepository;
  final StorageRepository storageRepository;
  RecurringRepositoryImpl(
    this.firebaseConfig,
    this.walletRepository,
    this.storageRepository,
  );

  String get _uid => firebaseConfig.auth.currentUser?.uid ?? '';

  CollectionReference<Map<String, dynamic>> get _doc => firebaseConfig.userDoc
      .collection(_uid)
      .doc(DefaultEnvironment.customer)
      .collection(DefaultEnvironment.recurring);
  @override
  Future<Either<String, AppError>> put(
    TransactionModel data,
  ) async {
    try {
      final param = data.toJson();
      if (data.id != null) {
        await _doc.doc(data.id).set(param);
        return Left(data.id!);
      } else {
        final result = await _doc.add(param);
        return Left(result.id);
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

  Future<TransactionModel> _get(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    final transaction = TransactionModel.fromDocument(element);
    //get image
    final photos = await Future.wait(
      (transaction.photos ?? []).map((e) async => await _getUrlImage(e)),
    );
    return transaction.copyWith(
      photos:
          photos.where((element) => element.isNotEmpty).toList(growable: false),
    );
  }

  Future<String> _getUrlImage(String path) async {
    final result = await storageRepository.downloadUrl(pathStorage: path);
    return result.isLeft ? result.left : '';
  }

  @override
  Stream<Either<List<TransactionModel>, AppError>> stream() {
    try {
      //lấy giao dịch trong khoản thời gian time
      final result = _doc
          .snapshots()
          .map<Future<Either<List<TransactionModel>, AppError>>>((event) async {
        try {
          final data = <TransactionModel>[];
          for (var element in event.docs) {
            final result = await _get(element);
            data.add(result);
          }
          return Left(data);
        } catch (e) {
          return Right(AppError(message: e.toString()));
        }
      });
      return result.asyncMap((event) => event);
    } catch (e) {
      return Stream.value(Right(AppError(message: e.toString())));
    }
  }
}
