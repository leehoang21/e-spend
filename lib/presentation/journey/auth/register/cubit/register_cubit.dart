import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/configs/default_environment.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/domain/use_cases/storage_use_case.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../../common/utils/pick_image.dart';
import '../../../../routers/app_router.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends BaseBloc<RegisterState> {
  final StorageUseCase pickImageUseCase;
  final AuthUseCase authUseCase;

  RegisterCubit({
    required this.pickImageUseCase,
    required this.authUseCase,
  }) : super(
          RegisterState(
            userModel: UserModel(
              phoneNumber: '',
              uId: '',
            ),
          ),
        );

  void initState(String phoneNumber) async {
    emit(
      state.copyWith(
        userModel: UserModel(
          phoneNumber: phoneNumber,
          uId: null,
        ),
      ),
    );
  }

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

  Future<void> register(
      {required String email,
      required String userName,
      required String phoneNumber,
      required String password}) async {
    showLoading();
    //login

    File? avatar = state.avatar;
    const String storagePath = DefaultEnvironment.avatar;
    if (avatar != null) {
      final result = await pickImageUseCase.put(
        imageToUpload: avatar,
        imagePathStorage: storagePath,
      );

      if (result != null) {
        showSnackbar(translationKey: result.toString());

        hideLoading();
        return;
      }
    }
    emit(
      state.copyWith(
        userModel: state.userModel.copyWith(
          avatar: storagePath,
          email: email,
          userName: userName,
          phoneNumber: phoneNumber,
        ),
      ),
    );
    final error = await authUseCase.register(
      user: state.userModel,
      password: password,
    );
    if (error != null) {
      showSnackbar(translationKey: error.message);
    }
    hideLoading();
    replace(
      const MainRoute(),
    );
  }
}
