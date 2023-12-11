import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
part 'register_account_state.dart';

@injectable
class RegisterAccountCubit extends BaseBloc<RegisterAccountState> {
  RegisterAccountCubit(this.authUseCase) : super(RegisterAccountState());
  final AuthUseCase authUseCase;

  registerAccount(String phone) {
    push(VerifyOtpRoute(phoneNumber: phone, loginType: LoginType.phone));
  }
}
