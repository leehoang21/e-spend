import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/utils/formatter/mask_input_formatter.dart';
import '../../../../common/utils/pick_image_function.dart';
import '../../../../common/utils/validator.dart';
import '../../../routers/app_router.dart';
import '../../../themes/themes.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/image_app_widget/image_app.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import '../widgets/auth_scaffold/auth_scaffold.dart';
import 'cubit/register_cubit.dart';
import 'register_screen_contant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: RegisterScreenContant.topHeightLogo,
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
                  path: context.read<RegisterCubit>().state.avatar?.path,
                ),
              ),
            ),
            SizedBox(
              height: AppDimens.height_32,
            ),
            TextFieldWidget(
              validate: (value) {
                if (isNullEmpty(value)) {
                  return null;
                }
                if ((value?.length ?? 0) < 10) {
                  return 'invalid phone number'.tr;
                }
                return null;
              },
              inputFormatter: [MaskedInputFormatter('#### ### ###')],
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              hintText: RegisterScreenContant.hintPhone,
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
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: AppDimens.height_16,
            ),
            SecurityTextFieldWidget(
              controller: _passwordController,
              hintText: RegisterScreenContant.hintPassword,
              validate: AppValidator.validatePassword,
            ),
            SizedBox(
              height: AppDimens.height_12,
            ),
            SecurityTextFieldWidget(
              controller: _passwordConfirmController,
              hintText: RegisterScreenContant.hintConfirmPassword,
              validate: (value) {
                if (value != _passwordController.text) {
                  return 'Password_incorrect'.tr;
                }
                return null;
              },
            ),
            SizedBox(
              height: RegisterScreenContant.distanceButtonToField,
            ),
            TextButtonWidget(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await registerOnPressed(context);
                }
              },
              title: RegisterScreenContant.title,
            ),
            SizedBox(
              height: RegisterScreenContant.distanceButtonToField,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: AppDimens.width_12),
                child: RichText(
                    text: TextSpan(
                  text: '${RegisterScreenContant.haveAccount} ',
                  style: ThemeText.caption,
                  children: [
                    TextSpan(
                      text: RegisterScreenContant.login,
                      style: ThemeText.caption.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.replace(const LoginRoute());
                        },
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerOnPressed(BuildContext context) async {
    context.read<RegisterCubit>().register(
          email: _emailController.text,
          userName: _userNameController.text,
          phoneNumber: _phoneController.text,
          password: _passwordController.text,
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
