part of 'buget_cubit.dart';

class BugetState extends Equatable {
  final bool isObscurePassword;
  final bool canAuthBiometric;

  const BugetState({
    this.isObscurePassword = false,
    this.canAuthBiometric = false,
  });

  BugetState copyWith({
    bool? isObscurePassword,
    bool? canAuthBiometric,
  }) {
    return BugetState(
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      canAuthBiometric: canAuthBiometric ?? this.canAuthBiometric,
    );
  }

  @override
  List<Object?> get props => [isObscurePassword, canAuthBiometric];
}
