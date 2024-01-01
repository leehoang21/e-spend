import 'package:flutter/material.dart';
import 'package:flutter_e_spend/presentation/journey/auth/login/widget/login_with_item.dart';
import 'package:flutter_e_spend/presentation/journey/auth/widgets/auth_scaffold/auth_scaffold_contants.dart';
import 'devider_text_widget.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AuthScaffoldConstants.horizontal,
        ),
        child: Column(
          children: [
            body,
            SizedBox(
              height: AuthScaffoldConstants.distanceButtonToField,
            ),
            const DeviderTextWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: AuthScaffoldConstants.listIconsLogin(context)
                  .map(
                    (e) => ItemLoginWithWidget(data: e),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
