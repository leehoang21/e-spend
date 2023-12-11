part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool isObscurePassword;

  const LoginState({
    this.isObscurePassword = false,
  });

  LoginState copyWith({
    bool? isObscurePassword,
  }) {
    return LoginState(
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
    );
  }

  @override
  List<Object?> get props => [isObscurePassword];
}
