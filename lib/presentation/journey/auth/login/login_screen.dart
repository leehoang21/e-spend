import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/presentation/journey/auth/login/cubit/login_cubit.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../common/utils/validator.dart';
import '../../../themes/themes.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import '../widgets/auth_scaffold/auth_scaffold.dart';
import 'login_constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: LoginConstants.topHeightLogo),
              child: Assets.images.logoSplash.image(
                height: LoginConstants.sizeLogo,
                width: LoginConstants.sizeLogo,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LoginConstants.login,
                  style: ThemeText.style18Bold,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: LoginConstants.distanceTextToField),
                  child: TextFieldWidget(
                    controller: controller,
                    hintText: LoginConstants.hintEmail,
                    validate: AppValidator.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon:
                        !context.watch<LoginCubit>().state.canAuthBiometric
                            ? const SizedBox()
                            : InkWell(
                                onTap: () {
                                  context.read<LoginCubit>().loginWithOther(
                                        LoginType.biometrics,
                                      );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: canCheckBiometricsSupport(context
                                      .watch<LoginCubit>()
                                      .state
                                      .biometricType),
                                ),
                              ),
                    textStyle: ThemeText.style14Medium
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: LoginConstants.distanceTextToField),
                  child: SecurityTextFieldWidget(
                    controller: controllerPassword,
                    keyboardType: TextInputType.text,
                    validate: AppValidator.validatePassword,
                    hintText: LoginConstants.yourPassword,
                    textStyle: ThemeText.style14Medium
                        .copyWith(fontWeight: FontWeight.normal),
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
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().login(
                              controller.text,
                              controllerPassword.text,
                            );
                      }
                    },
                    title: LoginConstants.signIn,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: AppDimens.width_12),
                    child: RichText(
                        text: TextSpan(
                      text: '${LoginConstants.notHaveAccount} ',
                      style: ThemeText.caption,
                      children: [
                        TextSpan(
                          text: LoginConstants.register,
                          style: ThemeText.caption.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.router.replace(const RegisterRoute());
                            },
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget canCheckBiometricsSupport(BiometricType type) {
    switch (type) {
      case BiometricType.face:
        return Assets.icons.icFaceId.image(
          height: AppDimens.space_24,
          width: AppDimens.space_24,
        );
      case BiometricType.fingerprint:
        return const Icon(
          Icons.fingerprint,
        );
      case BiometricType.iris:
        return Assets.icons.icIris.image(
          height: AppDimens.space_24,
          width: AppDimens.space_24,
        );
      case BiometricType.strong:
        return Assets.icons.icBiometrics.image(
          height: AppDimens.space_24,
          width: AppDimens.space_24,
        );
      default:
        return const SizedBox();
    }
  }
}
