import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/domain/use_cases/pick_image_use_case.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
part 'pick_image_state.dart';

@injectable
class PickImageCubit extends BaseBloc<PickImageState> {
  PickImageCubit(this._pickImageUseCase) : super(PickImageInitial());
  final StorageUseCase _pickImageUseCase;

  void addImage(File image) {
    emit(ResultImage(image));
  }

  Future<void> upImageStorage(
    String imagePathStorage,
  ) async {
    File? image = state.image;
    if (image != null) {
      try {
        final result = await _pickImageUseCase.put(
          imagePathStorage: imagePathStorage,
          imageToUpload: image,
        );
        if (result == null) {
          emit(const DownloadSuccess());
        } else {
          emit(const DownloadFailure());
        }
      } catch (e) {
        emit(const PickImageError('error_message'));
      }
    } else {
      emit(
        const PickImageError('no_image_selected'),
      );
    }
  }
}
