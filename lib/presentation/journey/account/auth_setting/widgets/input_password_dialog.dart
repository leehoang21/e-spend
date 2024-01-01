import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';

import '../../../../../common/utils/validator.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/button_widget/text_button_widget.dart';
import '../../../../widgets/text_field_widget/text_field_widget.dart';

class InputPasswordDialog extends StatefulWidget {
  const InputPasswordDialog({
    super.key,
    required this.onConfirm,
  });
  final Function(String password) onConfirm;

  @override
  State<InputPasswordDialog> createState() => _InputPasswordDialogState();
}

class _InputPasswordDialogState extends State<InputPasswordDialog> {
  late final TextEditingController controllerPassword;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    controllerPassword = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.width_16,
        vertical: AppDimens.height_16,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: AppDimens.width_16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimens.radius_12),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              'please_pass'.tr,
              style: ThemeText.style18Bold,
            ),
            SizedBox(
              height: AppDimens.height_20,
            ),
            SecurityTextFieldWidget(
              controller: controllerPassword,
              keyboardType: TextInputType.text,
              validate: AppValidator.validatePassword,
              hintText: 'your_password'.tr,
              textStyle: ThemeText.style14Medium
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: AppDimens.height_20,
            ),
            TextButtonWidget(
              onPressed: () async {
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus!.unfocus();
                }
                if (formKey.currentState!.validate()) {
                  widget.onConfirm(controllerPassword.text);
                }
              },
              title: 'OK',
            ),
          ],
        ),
      ),
    );
  }
}
