import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/configs/firebase_config.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:flutter_e_spend/domain/repositories/storage_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../models/transaction_model.dart';

@Injectable(as: TransactionRepository)
class TransactionRepositoryImpl extends TransactionRepository {
  final FirebaseConfig firebaseConfig;
  final WalletRepository walletRepository;
  final StorageRepository storageRepository;
  TransactionRepositoryImpl(
    this.firebaseConfig,
    this.walletRepository,
    this.storageRepository,
  );

  String get _uid => firebaseConfig.auth.currentUser?.uid ?? '';

  CollectionReference<Map<String, dynamic>> get _doc => firebaseConfig.userDoc
      .collection(_uid)
      .doc(DefaultEnvironment.customer)
      .collection(DefaultEnvironment.transaction);
  @override
  Future<Either<String, AppError>> create(
    TransactionModel transaction,
    String? id,
    String? walletId,
  ) async {
    try {
      final param = transaction.toJson();
      await _changeWallet(transaction, walletId);
      if (id != null) {
        await _doc.doc(id).set(param);
        return Left(id);
      } else {
        final result = await _doc.add(param);
        return Left(result.id);
      }
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<AppError?> update(
    TransactionModel transaction, {
    required TransactionModel transactionOld,
  }) async {
    try {
      await _doc.doc(transaction.id).update(
            transaction.toJson(),
          );
      await _changeWallet(
        transaction.copyWith(
          amount: transaction.amount - transactionOld.amount,
        ),
        null,
      );
      return null;
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  @override
  Future<AppError?> delete(TransactionModel transaction) async {
    try {
      await _doc.doc(transaction.id).delete();
      await _changeWallet(
        transaction.copyWith(amount: -transaction.amount),
        null,
      );
      return null;
    } catch (e) {
      return AppError(message: e.toString());
    }
  }

  Future<TransactionModel> _changeWallet(
    TransactionModel transaction,
    String? idWallet,
  ) async {
    TransactionModel model = transaction;
    model = model.copyWith(
      wallet: model.wallet.copyWith(
        balance: (model.wallet.balance ?? 0) + transaction.amount,
        lastUpdate: DateTime.now().millisecond,
      ),
    );
    await walletRepository.put(walletModel: model.wallet, id: idWallet);
    return model;
  }

  @override
  Future<Either<List<TransactionModel>, AppError>> get({
    required Timestamp toTime,
    required Timestamp fromTime,
    required DocumentSnapshot<Object?>? documentSnapshot,
    required int limit,
  }) async {
    try {
      if (documentSnapshot == null) [];
      final result = await _doc
          .orderBy('spendTime', descending: true)
          .where(
            'spendTime',
            isGreaterThanOrEqualTo: fromTime,
            isLessThanOrEqualTo: toTime,
          )
          .limit(limit)
          .startAtDocument(documentSnapshot!)
          .get();

      final data = <TransactionModel>[];
      for (var element in result.docs) {
        final transaction = await _get(element);
        data.add(transaction);
      }
      return Left(data);
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  Future<TransactionModel> _get(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    final transaction = TransactionModel.fromDocument(element);
    //get image
    final photos = await Future.wait(
      (transaction.photos).map((e) async => await _getUrlImage(e)),
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
  Stream<Either<List<TransactionModel>, AppError>> stream({
    required Timestamp toTime,
    required Timestamp fromTime,
    required int limit,
  }) {
    try {
      //lấy giao dịch trong khoản thời gian time
      final result = _doc
          .orderBy('spendTime', descending: true)
          .where(
            'spendTime',
            isGreaterThanOrEqualTo: fromTime,
            isLessThanOrEqualTo: toTime,
          )
          .limit(limit)
          .snapshots()
          .map<Future<Either<List<TransactionModel>, AppError>>>((event) async {
        try {
          final data = <TransactionModel>[];
          for (var element in event.docs) {
            final transaction = await _get(element);
            data.add(transaction);
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
