import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_e_spend/domain/use_cases/storage_use_case.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../../common/utils/pick_image.dart';
import '../../../../../domain/use_cases/user_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends BaseBloc<ProfileState> {
  final StorageUseCase pickImageUseCase;
  final UserUseCase useCase;
  final HiveConfig hiveConfig;

  ProfileCubit({
    required this.useCase,
    required this.pickImageUseCase,
    required this.hiveConfig,
  }) : super(
          const ProfileState(),
        );

  Future addAvatar(ImageSource source) async {
    try {
      final image = await PickImage().pickImage(source: source);
      if (image == null) return;
      emit(
        state.copyWith(avatar: image),
      );
    } catch (e) {
      showSnackbar(translationKey: e.toString());
    }
  }

  Future<void> update({
    required UserModel user,
  }) async {
    showLoading();
    //login

    File? avatar = state.avatar;
    const String storagePath = DefaultEnvironment.avatar;
    if (avatar != null) {
      final result = await pickImageUseCase.put(
        imageToUpload: avatar,
        imagePathStorage: storagePath,
      );
      user = user.copyWith(avatar: storagePath);
      if (result != null) {
        showSnackbar(translationKey: result.toString());
        hideLoading();
        return;
      }
    }

    final result = await useCase.updateUser(
      user,
    );
    if (result != null) {
      showSnackbar(translationKey: result.toString());
      hideLoading();
      return;
    }

    hideLoading();
    await pop(null);
  }
}
