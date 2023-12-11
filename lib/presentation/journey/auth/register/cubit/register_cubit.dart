import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_e_spend/domain/use_cases/auth_use_case.dart';
import 'package:flutter_e_spend/domain/use_cases/pick_image_use_case.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../common/utils/validator.dart';
import '../../../../../domain/use_cases/user_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends BaseBloc<RegisterState> {
  final StorageUseCase pickImageUseCase;
  final UserUseCase useCase;
  final AuthUseCase authUseCase;

  RegisterCubit({
    required this.useCase,
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

  void addAvatar(File image) {
    emit(
      state.copyWith(avatar: image),
    );
  }

  Future<void> register({
    required String email,
    required String userName,
  }) async {
    showLoading();
    //login

    File? avatar = state.avatar;
    const String storagePath = StringConstants.avatarStoragePath;
    emit(
      state.copyWith(errorMessage: null),
    );
    if (avatar != null) {
      final result = await pickImageUseCase.put(
        imageToUpload: avatar,
        imagePathStorage: storagePath,
      );
      emit(
        state.copyWith(
          userModel: state.userModel.copyWith(
            avatar: storagePath,
            email: email,
            userName: userName,
          ),
        ),
      );
      if (result != null) {
        emit(
          state.copyWith(errorMessage: result.toString()),
        );
        hideLoading();
        return;
      }
    }

    if (!AppValidator().isNullEmpty(email)) {
      if (!AppValidator.expEmail.hasMatch(email)) {
        emit(
          state.copyWith(errorMessage: 'invalid_email'),
        );
        hideLoading();
        return;
      }
    }

    if (userName.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'user_empty',
        ),
      );
      hideLoading();
      return;
    }
    final result = await useCase.updateUser(
      state.userModel.copyWith(
        email: email,
        userName: userName,
        avatar: avatar != null ? storagePath : null,
      ),
    );
    if (result != null) {
      emit(
        state.copyWith(errorMessage: result.toString()),
      );
      hideLoading();
      return;
    }
    hideLoading();
  }
}
