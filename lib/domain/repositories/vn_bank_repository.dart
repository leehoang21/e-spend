import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import '../../data/models/bank_info_model.dart';

abstract class VnBankRepository {
  Future<Either<List<BankInfoModel>, AppError>> getVnBankList();
}
