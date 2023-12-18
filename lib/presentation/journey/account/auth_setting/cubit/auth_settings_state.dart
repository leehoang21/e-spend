part of 'auth_settings_cubit.dart';

class AuthSettingsState extends Equatable {
  const AuthSettingsState(
    this.isLocalAuth,
  );
  final bool isLocalAuth;

  factory AuthSettingsState.initial() => const AuthSettingsState(
        false,
      );

  AuthSettingsState copyWith({
    bool? isLocalAuth,
  }) {
    return AuthSettingsState(
      isLocalAuth ?? this.isLocalAuth,
    );
  }

  @override
  List<Object?> get props => [
        isLocalAuth,
      ];
}
