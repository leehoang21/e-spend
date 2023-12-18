import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/utils/pick_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'add_photo_state.dart';

@injectable
class AddPhotoBloc extends Cubit<AddPhotoState> {
  AddPhotoBloc() : super(AddPhotoState.initial());

  Future<void> openGallery() async {
    final images = await PickImage().multiImage();
    emit(
      state.copyWith(
        photos: state.photos..addAll(images),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> openCamera() async {
    final image = await PickImage().pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(
        state.copyWith(
          photos: state.photos..add(image),
          lastUpdate: DateTime.now(),
        ),
      );
    }
  }
}
