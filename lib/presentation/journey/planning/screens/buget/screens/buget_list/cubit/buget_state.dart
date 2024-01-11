part of 'buget_cubit.dart';

class BugetState extends Equatable {
  final List<BugetModel> bugets;

  const BugetState({
    this.bugets = const [],
  });

  BugetState copyWith({
    List<BugetModel>? bugets,
  }) {
    return BugetState(
      bugets: bugets ?? this.bugets,
    );
  }

  @override
  List<Object?> get props => [bugets];
}
