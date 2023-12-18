import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/utils/validator.dart';
import 'package:flutter_e_spend/presentation/journey/account/register_login_with_password/cubit/register_login_with_password_cubit.dart';
import '../../../themes/themes.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import 'register_login_with_password_constants.dart';

class RegisterLoginWithPasswordScreen extends StatelessWidget {
  RegisterLoginWithPasswordScreen({
    Key? key,
    required this.enabled,
  }) : super(key: key);

  final TextEditingController oldController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final TextEditingController controllerConfirm = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: RegisterLoginWithPasswordConstants.topHeightLogo),
              child: Assets.images.logoSplash.image(
                height: RegisterLoginWithPasswordConstants.sizeLogo,
                width: RegisterLoginWithPasswordConstants.sizeLogo,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal:
                          RegisterLoginWithPasswordConstants.horizontalScreen)
                  .copyWith(top: RegisterLoginWithPasswordConstants.topColumn),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      RegisterLoginWithPasswordConstants.createPassword,
                      style: ThemeText.style18Bold,
                    ),
                    if (enabled)
                      Padding(
                        padding: EdgeInsets.only(
                            top: RegisterLoginWithPasswordConstants
                                .distanceTextToField),
                        child: SecurityTextFieldWidget(
                          controller: oldController,
                          keyboardType: TextInputType.text,
                          validate: AppValidator.validatePassword,
                          hintText:
                              RegisterLoginWithPasswordConstants.oldPassword,
                          textStyle: ThemeText.style14Medium
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: RegisterLoginWithPasswordConstants
                              .distanceTextToField),
                      child: SecurityTextFieldWidget(
                        controller: controller,
                        keyboardType: TextInputType.text,
                        validate: AppValidator.validatePassword,
                        hintText:
                            RegisterLoginWithPasswordConstants.yourPassword,
                        textStyle: ThemeText.style14Medium
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: RegisterLoginWithPasswordConstants
                              .distanceTextToField),
                      child: SecurityTextFieldWidget(
                        controller: controllerConfirm,
                        keyboardType: TextInputType.text,
                        hintText: RegisterLoginWithPasswordConstants.confirm,
                        onEditingComplete: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<RegisterLoginWithPasswordCubit>()
                                .changePassword(
                                  controller.text,
                                  oldController.text,
                                  enabled,
                                );
                          }
                        },
                        textStyle: ThemeText.style14Medium
                            .copyWith(fontWeight: FontWeight.normal),
                        validate: (value) {
                          if (value != controller.text) {
                            return RegisterLoginWithPasswordConstants
                                .passwordIncorrect;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: RegisterLoginWithPasswordConstants
                            .distanceButtonToField,
                      ),
                      child: TextButtonWidget(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<RegisterLoginWithPasswordCubit>()
                                .changePassword(
                                  controller.text,
                                  oldController.text,
                                  enabled,
                                );
                          }
                        },
                        title:
                            RegisterLoginWithPasswordConstants.createPassword,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
