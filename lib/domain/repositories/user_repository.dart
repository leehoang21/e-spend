import 'package:flutter_e_spend/data/models/user_model.dart';

import '../../common/exception/app_error.dart';

abstract class UserRepository {
  Future<AppError?> updateUser(UserModel data);
  Future<UserModel?> getUser();
  Future<bool> exits();
}
