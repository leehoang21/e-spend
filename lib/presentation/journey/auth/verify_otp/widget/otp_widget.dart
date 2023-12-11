import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../themes/themes.dart';
import '../../../../widgets/button_widget/text_button_widget.dart';
import '../cubit/verify_cubit.dart';
import '../verify_otp_constants.dart';
import 'button_rich_text_widget.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          VerifyOtpConstants.verifyAccount,
          style: ThemeText.style18Bold,
          textAlign: TextAlign.left,
        ),
        Text(
          VerifyOtpConstants.description,
          style: ThemeText.caption
              .copyWith(fontWeight: FontWeight.w500, color: AppColor.grey),
        ),
        SizedBox(
          height: VerifyOtpConstants.distanceTextToFieldInput,
        ),
        PinCodeTextField(
          keyboardType: TextInputType.number,
          cursorColor: AppColor.taupeGray,
          appContext: context,
          length: 6,
          controller: context.read<VerifyCubit>().pinCodeController,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(6),
            fieldHeight: VerifyOtpConstants.widthFieldInput,
            fieldWidth: VerifyOtpConstants.widthFieldInput,
            borderWidth: 2,
            activeColor: AppColor.taupeGray,
            inactiveColor: AppColor.platinum,
            selectedColor: AppColor.taupeGray,
          ),
        ),
        Align(
          child: Text(
            context.watch<VerifyCubit>().state.timeResend,
            style: ThemeText.style14Medium.copyWith(
                color: AppColor.taupeGray, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: VerifyOtpConstants.distanceTextToFieldInput),
          child: const ButtonRichTextWidget(),
        ),
        TextButtonWidget(
          onPressed: () {
            context.read<VerifyCubit>().verifyOtp();
          },
          title: VerifyOtpConstants.confirm,
        ),
      ],
    );
  }
}
