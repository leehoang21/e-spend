part of 'time_cubit.dart';

class TimeState extends Equatable {
  final TimeModel time;

  const TimeState({
    required this.time,
  });

  factory TimeState.initial() => const TimeState(
        time: TimeModel(),
      );

  TimeState copyWith({
    TimeModel? time,
  }) {
    return TimeState(
      time: time ?? this.time,
    );
  }

  @override
  List<Object?> get props => [time];
}
