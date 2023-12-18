import 'dart:io';

import 'package:equatable/equatable.dart';

enum AddPhotoStatus { initial, loading, success, failed }

class AddPhotoState extends Equatable {
  final AddPhotoStatus status;
  final List<File> photos;
  final DateTime lastUpdate;

  const AddPhotoState({
    required this.status,
    required this.photos,
    required this.lastUpdate,
  });

  factory AddPhotoState.initial() => AddPhotoState(
        status: AddPhotoStatus.initial,
        // ignore: prefer_const_literals_to_create_immutables
        photos: [],
        lastUpdate: DateTime.now(),
      );

  @override
  List<Object?> get props => [status, photos, lastUpdate];

  AddPhotoState copyWith({
    AddPhotoStatus? status,
    List<File>? photos,
    DateTime? lastUpdate,
  }) {
    return AddPhotoState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
