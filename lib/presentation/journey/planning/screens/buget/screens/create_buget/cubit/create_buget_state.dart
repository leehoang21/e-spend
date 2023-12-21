part of 'create_buget_cubit.dart';

class CreateBugetState extends Equatable {
  final bool isObscurePassword;
  final bool canAuthBiometric;

  const CreateBugetState({
    this.isObscurePassword = false,
    this.canAuthBiometric = false,
  });

  CreateBugetState copyWith({
    bool? isObscurePassword,
    bool? canAuthBiometric,
  }) {
    return CreateBugetState(
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      canAuthBiometric: canAuthBiometric ?? this.canAuthBiometric,
    );
  }

  @override
  List<Object?> get props => [isObscurePassword, canAuthBiometric];
}
