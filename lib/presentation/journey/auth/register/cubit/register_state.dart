part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final File? avatar;
  final UserModel userModel;
  const RegisterState({
    required this.userModel,
    this.avatar,
  });

  RegisterState copyWith({
    UserModel? userModel,
    File? avatar,
  }) {
    return RegisterState(
      userModel: userModel ?? this.userModel,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [userModel, avatar];
}
