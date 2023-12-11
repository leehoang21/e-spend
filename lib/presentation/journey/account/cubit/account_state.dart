part of 'account_cubit.dart';

enum AccountStateStatus {
  initial,
  loading,
  loaded,
}

class AccountState extends Equatable {
  final AccountStateStatus status;

  final UserModel userModel;

  const AccountState({
    required this.userModel,
    this.status = AccountStateStatus.initial,
  });

  factory AccountState.initial() {
    return AccountState(
      userModel: UserModel(
        phoneNumber: '',
        uId: null,
      ),
    );
  }

  AccountState copyWith({
    UserModel? userModel,
    Uint8List? avatar,
    AccountStateStatus? status,
  }) {
    return AccountState(
      userModel: userModel ?? this.userModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        userModel,
        status,
      ];
}
