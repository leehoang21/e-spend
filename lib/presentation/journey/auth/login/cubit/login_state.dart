part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool isObscurePassword;
  final bool canAuthBiometric;
  final BiometricType biometricType;

  const LoginState({
    this.isObscurePassword = false,
    this.canAuthBiometric = false,
    required this.biometricType,
  });

  LoginState copyWith({
    bool? isObscurePassword,
    bool? canAuthBiometric,
    BiometricType? biometricType,
  }) {
    return LoginState(
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      canAuthBiometric: canAuthBiometric ?? this.canAuthBiometric,
      biometricType: biometricType ?? this.biometricType,
    );
  }

  @override
  List<Object?> get props =>
      [isObscurePassword, canAuthBiometric, biometricType];
}
