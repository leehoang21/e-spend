import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/use_cases/auth_use_case.dart';
import '../../../bloc/base_bloc/base_bloc.dart';

part 'account_state.dart';

@injectable
class AccountCubit extends BaseBloc<AccountState> {
  final HiveConfig hiveConfig;
  final AuthUseCase authenticationUseCase;
  AccountCubit(
    this.hiveConfig,
    this.authenticationUseCase,
  ) : super(const AccountState());

  void signOut() async {
    await authenticationUseCase.signOut();
    hiveConfig.clear();
  }
}
