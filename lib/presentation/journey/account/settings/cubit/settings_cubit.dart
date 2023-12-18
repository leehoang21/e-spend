import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../common/enums/login_type.dart';
import '../../../../routers/app_router.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends BaseBloc<SettingsState> {
  SettingsCubit(
    this.hiveConfig,
    this.authUseCase,
  ) : super(SettingsState.initial());

  final HiveConfig hiveConfig;
  final AuthUseCase authUseCase;

  Future<void> linkSocial({
    required LoginType loginType,
  }) async {
    final result = await push(
      VerifyOtpRoute(
        phoneNumber: hiveConfig.user!.phoneNumber ?? '',
        loginType: loginType,
      ),
    );

    if (result == false) {
      showSnackbar(
        translationKey: 'link_social_fail',
      );
      return;
    }
  }
}
