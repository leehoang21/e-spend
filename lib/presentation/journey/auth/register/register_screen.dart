import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/utils/pick_image_function.dart';
import '../../../../common/utils/validator.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/image_app_widget/image_app.dart';
import '../../../widgets/scaffold_wdiget/scaffold_widget.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import 'cubit/register_cubit.dart';
import 'register_screen_contant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;

  late final TextEditingController _userNameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: RegisterScreenContant.title,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimens.height_12,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _pickImage(context);
                      },
                      child: ClipOval(
                        child: AppImageWidget(
                          width: 80.w,
                          height: 80.w,
                          fit: BoxFit.fill,
                          defultImage: Assets.images.defaultAvatar.image(),
                          path:
                              context.read<RegisterCubit>().state.avatar?.path,
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
                      validate: AppValidator.validateUseName,
                    ),
                    SizedBox(
                      height: AppDimens.height_12,
                    ),
                    TextFieldWidget(
                      controller: _emailController,
                      hintText: RegisterScreenContant.hintEmail,
                      validate: AppValidator.validateEmail,
                    ),
                    SizedBox(
                      height: AppDimens.height_16,
                    ),
                    TextButtonWidget(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await registerOnPressed(context);
                        }
                      },
                      title: RegisterScreenContant.title,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Future<void> registerOnPressed(BuildContext context) async {
    context.read<RegisterCubit>().register(
          email: _emailController.text,
          userName: _userNameController.text,
        );
  }

  Future<void> _pickImage(BuildContext context) async {
    await pickImageFuncion(
        context: context,
        gallery: (_) async {
          await context.read<RegisterCubit>().addAvatar(ImageSource.gallery);
        },
        camera: (context) async {
          await context.read<RegisterCubit>().addAvatar(ImageSource.camera);
        });
  }
}
