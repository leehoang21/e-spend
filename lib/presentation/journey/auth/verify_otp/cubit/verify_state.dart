part of 'verify_cubit.dart';

abstract class VerifyState extends Equatable {
  const VerifyState(this.timeResend);

  final String timeResend;

  @override
  List<Object> get props => [timeResend];
}

class VerifyInitial extends VerifyState {
  const VerifyInitial() : super('0:05:00');
}

class VerifyLoading extends VerifyState {
  const VerifyLoading(String timeResend) : super(timeResend);
}

class Verifyloaded extends VerifyState {
  const Verifyloaded(String timeResend) : super(timeResend);
}

class VerifySuccess extends VerifyState {
  const VerifySuccess(String timeResend, this.isUserFirestore)
      : super(timeResend);

  final bool isUserFirestore;
}

class VerifyFailure extends VerifyState {
  const VerifyFailure({required this.error, required String timeResend})
      : super(timeResend);
  final String error;
}
