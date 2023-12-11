import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/domain/use_cases/pick_image_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../../data/models/user_model.dart';
import '../../../../domain/use_cases/auth_use_case.dart';
import '../../../bloc/base_bloc/base_bloc.dart';

part 'account_state.dart';

@injectable
class AccountCubit extends BaseBloc<AccountState> {
  final HiveConfig hiveConfig;
  final AuthUseCase authenticationUseCase;
  final StorageUseCase pickImageUseCase;
  AccountCubit(
      this.hiveConfig, this.authenticationUseCase, this.pickImageUseCase)
      : super(AccountState.initial());

  void getUser() async {
    emit(state.copyWith(status: AccountStateStatus.loading));
    final result = hiveConfig.user ?? UserModel(phoneNumber: '', uId: 'uId');

    late final String avatar;
    if (!isNullEmpty(result.avatar)) {
      final data =
          await pickImageUseCase.downUrl(imagePathStorage: result.avatar!);
      avatar = data.isLeft ? data.left : '';
    } else {
      avatar = '';
    }
    emit(state.copyWith(
      userModel: result.copyWith(avatar: avatar),
      status: AccountStateStatus.loaded,
    ));
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void signOut() async {
    await authenticationUseCase.signOut();
  }
}
