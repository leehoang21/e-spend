import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/bank_info_model.dart';
import '../repositories/vn_bank_repository.dart';

@injectable
class VnBankUseCase {
  final VnBankRepository _vnBankRepository;

  VnBankUseCase(this._vnBankRepository);
  Future<Either<List<BankInfoModel>, AppError>> getVnBankList() async {
    return await _vnBankRepository.getVnBankList();
  }
}
