import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/common/utils/validator.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/button_widget/text_button_widget.dart';
import '../../../../widgets/text_field_widget/text_field_widget.dart';
import 'login_constants.dart';

@RoutePage()
class LoginWithPasswordScreenProvider extends StatelessWidget {
  LoginWithPasswordScreenProvider({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final TextEditingController controllerConfirm = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: LoginWithPasswordConstants.topHeightLogo),
              child: Assets.images.logoSplash.image(
                height: LoginWithPasswordConstants.sizeLogo,
                width: LoginWithPasswordConstants.sizeLogo,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: LoginWithPasswordConstants.horizontalScreen)
                  .copyWith(top: LoginWithPasswordConstants.topColumn),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LoginWithPasswordConstants.createPassword,
                      style: ThemeText.style18Bold,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: LoginWithPasswordConstants.distanceTextToField),
                      child: SecurityTextFieldWidget(
                        controller: controller,
                        keyboardType: TextInputType.text,
                        validate: AppValidator.validatePassword,
                        hintText: LoginWithPasswordConstants.yourPassword,
                        textStyle: ThemeText.style14Medium
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: LoginWithPasswordConstants.distanceTextToField),
                      child: SecurityTextFieldWidget(
                        controller: controllerConfirm,
                        keyboardType: TextInputType.text,
                        hintText: LoginWithPasswordConstants.confirm,
                        onEditingComplete: () {
                          if (formKey.currentState!.validate()) {
                            context.pushRoute(
                              VerifyOtpRoute(
                                phoneNumber:
                                    getIt.get<HiveConfig>().user?.phoneNumber ??
                                        '',
                                loginType: LoginType.password,
                                password: controller.text,
                              ),
                            );
                          }
                        },
                        textStyle: ThemeText.style14Medium
                            .copyWith(fontWeight: FontWeight.normal),
                        validate: (value) {
                          if (value != controller.text) {
                            return LoginWithPasswordConstants.passwordIncorrect;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical:
                            LoginWithPasswordConstants.distanceButtonToField,
                      ),
                      child: TextButtonWidget(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            context.pushRoute(
                              VerifyOtpRoute(
                                phoneNumber:
                                    getIt.get<HiveConfig>().user?.phoneNumber ??
                                        '',
                                loginType: LoginType.password,
                                password: controller.text,
                              ),
                            );
                          }
                        },
                        title: LoginWithPasswordConstants.createPassword,
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
