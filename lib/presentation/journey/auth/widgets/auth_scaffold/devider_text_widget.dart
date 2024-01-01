import 'package:flutter/material.dart';
import '../../../../themes/themes.dart';
import '../../login/login_constants.dart';

class DeviderTextWidget extends StatelessWidget {
  const DeviderTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(
          child: Divider(
        thickness: 1,
      )),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: LoginConstants.horizontalOr),
        child: Text(
          LoginConstants.or,
          style: ThemeText.style14Medium,
        ),
      ),
      const Expanded(
          child: Divider(
        thickness: 1,
      )),
    ]);
  }
}
