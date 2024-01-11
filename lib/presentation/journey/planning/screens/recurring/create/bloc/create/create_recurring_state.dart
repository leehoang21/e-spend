import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/data/models/recurring_model.dart';

enum CreateRecurringStatus { initial, loading, succes, failed, noInternet }

class CreateRecurringState extends Equatable {
  final CreateRecurringStatus status;
  final RecurringModel data;
  final bool buttonIsValid;
  const CreateRecurringState({
    required this.status,
    required this.data,
    this.buttonIsValid = false,
  });

  factory CreateRecurringState.initial() => const CreateRecurringState(
        status: CreateRecurringStatus.initial,
        data: RecurringModel(),
      );
  @override
  List<Object?> get props => [
        status,
        data,
        buttonIsValid,
      ];

  CreateRecurringState copyWith({
    CreateRecurringStatus? status,
    RecurringModel? data,
    bool? buttonIsValid,
  }) {
    return CreateRecurringState(
      status: status ?? this.status,
      data: data ?? this.data,
      buttonIsValid: buttonIsValid ?? this.buttonIsValid,
    );
  }

  @override
  String toString() {
    return 'CreateRecurringState(status: $status, data: $data)';
  }
}
