import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/presentation/journey/auth/register_account/cubit/register_account_cubit.dart';
import '../../../../common/utils/formatter/mask_input_formatter.dart';
import '../../../themes/themes.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import 'register_account_constants.dart';

class RegisterAccountScreen extends StatelessWidget {
  RegisterAccountScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: RegisterAccountConstants.topHeightLogo),
              child: Assets.images.logoSplash.image(
                height: RegisterAccountConstants.sizeLogo,
                width: RegisterAccountConstants.sizeLogo,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: RegisterAccountConstants.horizontalScreen)
                  .copyWith(top: RegisterAccountConstants.topColumn),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    RegisterAccountConstants.title,
                    style: ThemeText.style18Bold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: RegisterAccountConstants.distanceTextToField),
                    child: TextFieldWidget(
                      inputFormatter: [MaskedInputFormatter('#### ### ###')],
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      hintText: RegisterAccountConstants.yourPhone,
                      textStyle: ThemeText.style14Medium
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: RegisterAccountConstants.distanceButtonToField,
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

                        context
                            .read<RegisterAccountCubit>()
                            .registerAccount(phoneNumberFormat);
                      },
                      title: RegisterAccountConstants.title,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
