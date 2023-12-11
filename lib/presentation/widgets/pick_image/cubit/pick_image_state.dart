part of 'pick_image_cubit.dart';

abstract class PickImageState extends Equatable {
  final File? image;
  final String? error;
  const PickImageState({
    this.error,
    this.image,
  });

  @override
  List<Object?> get props => [error, image];
}

class PickImageInitial extends PickImageState {}

class PickImageError extends PickImageState {
  const PickImageError(String error) : super(error: error);
}

class ResultImage extends PickImageState {
  const ResultImage(File image) : super(image: image);
}

class DownloadSuccess extends PickImageState {
  const DownloadSuccess() : super();
}

class DownloadFailure extends PickImageState {
  const DownloadFailure() : super();
}
