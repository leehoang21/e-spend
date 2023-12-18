import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../common/configs/firebase_config.dart';
import '../../common/utils/app_utils.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../models/wallet_model.dart';

@Injectable(as: WalletRepository)
class WalletRepositoryImpl extends WalletRepository {
  final FirebaseConfig firebaseConfig;

  WalletRepositoryImpl(this.firebaseConfig);

  String get _uid => firebaseConfig.auth.currentUser?.uid ?? '';

  CollectionReference<Map<String, dynamic>> get _doc => firebaseConfig.userDoc
      .collection(_uid)
      .doc(DefaultEnvironment.customer)
      .collection(DefaultEnvironment.walletList);

  @override
  Future<Either<List<WalletModel>, AppError>> get() async {
    try {
      final response = await _doc.get();
      if (isNullEmpty(response.docs)) {
        log(response.docs.toString());
        return const Left([]);
      } else {
        Map data = {};
        return Left(response.docs.map((e) {
          data.addAll({e.id: e.data()});
          return WalletModel.fromJson(e.data(), e.id);
        }).toList());
      }
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<AppError?> put({required WalletModel walletModel}) async {
    try {
      if (walletModel.id == null) {
        await _doc.add(walletModel.toJson());
      } else {
        await _doc.doc(walletModel.id.toString()).update(walletModel.toJson());
      }
      return null;
    } catch (e) {
      return AppError(message: e.toString());
    }
  }
}
