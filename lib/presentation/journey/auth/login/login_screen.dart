import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';

import 'package:flutter_e_spend/presentation/journey/auth/login/cubit/login_cubit.dart';
import 'package:flutter_e_spend/presentation/journey/auth/login/widget/login_with_item.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import '../../../../common/utils/formatter/mask_input_formatter.dart';
import '../../../../common/utils/validator.dart';
import '../../../themes/themes.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import 'login_constants.dart';
import 'widget/devider_text_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: LoginConstants.topHeightLogo),
              child: Assets.images.logoSplash.image(
                height: LoginConstants.sizeLogo,
                width: LoginConstants.sizeLogo,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: LoginConstants.horizontalScreen)
                  .copyWith(top: LoginConstants.topColumn),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LoginConstants.login,
                    style: ThemeText.style18Bold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: LoginConstants.distanceTextToField),
                    child: TextFieldWidget(
                      inputFormatter: [MaskedInputFormatter('#### ### ###')],
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      hintText: LoginConstants.yourPhone,
                      textStyle: ThemeText.style14Medium
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  if (context.watch<LoginCubit>().state.isObscurePassword)
                    Padding(
                      padding: EdgeInsets.only(
                          top: LoginConstants.distanceTextToField),
                      child: Form(
                        key: formKey,
                        child: SecurityTextFieldWidget(
                          controller: controllerPassword,
                          keyboardType: TextInputType.text,
                          validate: AppValidator.validatePassword,
                          hintText: LoginConstants.yourPassword,
                          textStyle: ThemeText.style14Medium
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: LoginConstants.distanceButtonToField,
                    ),
                    child: TextButtonWidget(
                      onPressed: () async {
                        final currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus &&
                            currentFocus.focusedChild != null) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }

                        final phoneNumberFormat =
                            controller.text.replaceFirst(RegExp('0'), '+84');
                        if (context
                            .read<LoginCubit>()
                            .state
                            .isObscurePassword) {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().loginWithPassword(
                                phoneNumberFormat, controllerPassword.text);
                          }
                        } else {
                          context
                              .read<LoginCubit>()
                              .loginWithPhone(phoneNumberFormat);
                        }
                      },
                      title: LoginConstants.signIn,
                    ),
                  ),

                  //bạn chưa có tài khoản
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        text: LoginConstants.notHaveAccount,
                        style: ThemeText.style14Medium
                            .copyWith(fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushRoute(const RegisterAccountRoute());
                              },
                            text: '  ${LoginConstants.register}',
                            style: ThemeText.style14Medium,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: LoginConstants.distanceButtonToField,
                  ),
                  const DeviderTextWidget(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: LoginConstants.listIconsLogin(context)
                        .map(
                          (e) => ItemLoginWithWidget(data: e),
                        )
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
