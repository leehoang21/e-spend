import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../themes/themes.dart';
import '../cubit/verify_cubit.dart';
import '../verify_otp_constants.dart';

class ButtonRichTextWidget extends StatelessWidget {
  const ButtonRichTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 36),
          children: <TextSpan>[
            TextSpan(
              text: VerifyOtpConstants.notReceivecode,
              style:
                  ThemeText.style14Medium.copyWith(color: AppColor.taupeGray),
            ),
            TextSpan(
              text: VerifyOtpConstants.resend,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (context.read<VerifyCubit>().timeOut()) {
                    context.read<VerifyCubit>().verifyPhonenumber();
                  }
                },
              style: ThemeText.style14Medium,
            )
          ],
        ),
      ),
    );
  }
}
