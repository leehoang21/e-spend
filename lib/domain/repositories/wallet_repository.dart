import 'package:either_dart/either.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/wallet_model.dart';

abstract class WalletRepository {
  Future<Either<List<WalletModel>, AppError>> get();
  Future<AppError?> put({required WalletModel walletModel});
  Future<AppError?> delete({required String id});
}
