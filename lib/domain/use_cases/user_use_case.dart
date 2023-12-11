import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_e_spend/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../../common/exception/app_error.dart';

@injectable
class UserUseCase {
  final UserRepository repository;

  UserUseCase(this.repository);

  Future<AppError?> updateUser(UserModel data) async {
    return await repository.updateUser(data);
  }

  Future<bool> exits() async {
    return await repository.exits();
  }
}
