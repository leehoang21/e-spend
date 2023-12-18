part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final File? avatar;

  const ProfileState({
    this.avatar,
  });

  ProfileState copyWith({
    File? avatar,
  }) {
    return ProfileState(
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [avatar];
}
