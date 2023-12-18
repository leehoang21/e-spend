import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../common/exception/app_error.dart';
import '../../data/models/wallet_model.dart';
import '../repositories/wallet_repository.dart';

@injectable
class WalletUseCase {
  final WalletRepository repository;

  WalletUseCase({
    required this.repository,
  });

  Future<Either<List<WalletModel>, AppError>> get() {
    return repository.get();
  }

  Future<AppError?> put({required WalletModel walletModel}) {
    return repository.put(walletModel: walletModel);
  }

  Future<AppError?> delete({required String id}) {
    return repository.delete(id: id);
  }
}
