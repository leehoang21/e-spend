import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_e_spend/presentation/widgets/snackbar_widget/snackbar_widget.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/enums/login_type.dart';
import '../../../../routers/app_router.dart';

part 'register_login_with_password_state.dart';

@injectable
class RegisterLoginWithPasswordCubit
    extends BaseBloc<RegisterLoginWithPasswordState> {
  RegisterLoginWithPasswordCubit(this._authUseCase, this.hiveConfig)
      : super(RegisterLoginWithPasswordState.initial());

  final AuthUseCase _authUseCase;
  final HiveConfig hiveConfig;

  void changePassword(String newPass, String oldPass, bool enabled) async {
    if (enabled) {
      final result = await _authUseCase.updatePassword(
        newPass: newPass,
        oldPass: oldPass,
      );
      result.fold(
        (l) async {
          await pop(null);
          showSnackbar(
            translationKey: 'success',
            type: SnackBarType.success,
          );
        },
        (r) => showSnackbar(translationKey: r.message),
      );
    } else {
      push(
        VerifyOtpRoute(
          phoneNumber: hiveConfig.user!.phoneNumber!,
          loginType: LoginType.password,
          password: newPass,
        ),
      );
    }
  }
}
