part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool isObscurePassword;
  final bool canAuthBiometric;

  const LoginState({
    this.isObscurePassword = false,
    this.canAuthBiometric = false,
  });

  LoginState copyWith({
    bool? isObscurePassword,
    bool? canAuthBiometric,
  }) {
    return LoginState(
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      canAuthBiometric: canAuthBiometric ?? this.canAuthBiometric,
    );
  }

  @override
  List<Object?> get props => [isObscurePassword, canAuthBiometric];
}
