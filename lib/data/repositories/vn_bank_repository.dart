import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/exception/app_error.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../common/configs/dio/dio_config.dart';
import '../../common/enums/app_enums.dart';
import '../../domain/repositories/vn_bank_repository.dart';
import '../models/bank_info_model.dart';

@Injectable(as: VnBankRepository)
class VnBankRepositoryImpl extends VnBankRepository {
  final DioApiClient _dioApiClient;

  VnBankRepositoryImpl(this._dioApiClient);

  @override
  Future<Either<List<BankInfoModel>, AppError>> getVnBankList() async {
    try {
      final response = await _dioApiClient.request(
          method: NetworkMethod.get,
          url: '${DefaultEnvironment.bankHost}/v2/banks');
      if (response.code != 1000) {
        return Right(AppError(
            message: response.message ?? StringConstants.msgErrorUnknown));
      }
      final data = response.data as Map<String, dynamic>;

      final banks = data['data'] as List;
      final results = <BankInfoModel>[];
      for (var bank in banks) {
        results.add(BankInfoModel.fromJson(bank as Map<String, dynamic>));
      }
      results.sort((a, b) => a.code!.compareTo(b.code!));
      return Left(results);
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }
}
