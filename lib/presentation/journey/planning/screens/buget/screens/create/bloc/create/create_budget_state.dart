import 'package:equatable/equatable.dart';
import '../../../../../../../../../data/models/buget_model.dart';

enum CreateBugetStatus { initial, loading, succes, failed, noInternet }

class CreateBugetState extends Equatable {
  final CreateBugetStatus status;
  final BugetModel data;
  final bool buttonIsValid;
  const CreateBugetState({
    required this.status,
    required this.data,
    this.buttonIsValid = false,
  });

  factory CreateBugetState.initial() => const CreateBugetState(
        status: CreateBugetStatus.initial,
        data: BugetModel(),
      );
  @override
  List<Object?> get props => [
        status,
        data,
        buttonIsValid,
      ];

  CreateBugetState copyWith({
    CreateBugetStatus? status,
    BugetModel? data,
    bool? buttonIsValid,
  }) {
    return CreateBugetState(
      status: status ?? this.status,
      data: data ?? this.data,
      buttonIsValid: buttonIsValid ?? this.buttonIsValid,
    );
  }

  @override
  String toString() {
    return 'CreateBugetState(status: $status, data: $data)';
  }
}
