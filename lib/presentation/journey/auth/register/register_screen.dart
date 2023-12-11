// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/common/utils/pick_image.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/utils/pick_image_function.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/image_app_widget/image_app.dart';
import '../../../widgets/pick_image/cubit/pick_image_cubit.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import 'cubit/register_cubit.dart';
import 'register_screen_contant.dart';
import 'widget/back_ground_register.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;

  late final TextEditingController _userNameController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundRegister(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await _pickImage(context);
                    },
                    child: SizedBox(
                      width: AppDimens.space_80,
                      child: ClipOval(
                        child:
                            context.watch<RegisterCubit>().state.avatar != null
                                ? AppImageWidget(
                                    path: context
                                        .read<RegisterCubit>()
                                        .state
                                        .avatar
                                        ?.path,
                                  )
                                : Assets.images.defaultAvatar.image(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.height_32,
                  ),
                  TextFieldWidget(
                    enabled: false,
                    controller: TextEditingController(
                        text: context
                            .read<RegisterCubit>()
                            .state
                            .userModel
                            .phoneNumber),
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                  TextFieldWidget(
                    controller: _userNameController,
                    hintText: RegisterScreenContant.hintUserName,
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                  TextFieldWidget(
                    controller: _emailController,
                    hintText: RegisterScreenContant.hintEmail,
                  ),
                  SizedBox(
                    height: AppDimens.height_16,
                  ),
                  TextButtonWidget(
                    onPressed: () async {
                      await registerOnPressed(context);
                    },
                    title: RegisterScreenContant.title,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Future<void> registerOnPressed(BuildContext context) async {
    await context.read<RegisterCubit>().register(
          email: _emailController.text,
          userName: _userNameController.text,
        );
    String? error = context.read<RegisterCubit>().state.errorMessage;
    if (error != null) {
      context.showSnackbar(
        translationKey: error,
      );
    } else {
      context.router.pushAndPopUntil(
        const MainRoute(),
        predicate: (route) => false,
      );
    }
  }

  Future<void> _pickImage(BuildContext context) async {
    final result = await pickImageFuncion(
        context: context,
        gallery: (context) async {
          await PickImage().pickImage(source: ImageSource.gallery);
          _result(context);
        },
        camera: (context) async {
          await PickImage().pickImage(source: ImageSource.camera);
          _result(context);
        });
    result?.fold(
      (image) {
        context.read<RegisterCubit>().addAvatar(
              image,
            );
      },
      (error) {
        context.showSnackbar(
          translationKey: error,
        );
      },
    );
  }

  void _result(BuildContext context) {
    File? _image = context.read<PickImageCubit>().state.image;
    String? _error = context.read<PickImageCubit>().state.error;

    if (_image != null) {
      Navigator.pop(
        context,
        Left(_image),
      );
    }
    if (_error != null) {
      Navigator.pop(
        context,
        Right(_error),
      );
    }
  }
}
