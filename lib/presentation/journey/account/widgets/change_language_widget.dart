import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../common/assets/assets.gen.dart';
import '../../../routers/app_router.dart';
import '../../../widgets/drop_down_select/drop_down_select.dart';

class ChangeLanguegeWidget extends StatefulWidget {
  const ChangeLanguegeWidget({super.key});

  @override
  State<ChangeLanguegeWidget> createState() => _ChangeLanguegeWidgetState();
}

class _ChangeLanguegeWidgetState extends State<ChangeLanguegeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: DropDownSelectCustome(
        prefixIcon: Assets.icons.language.image(
          width: LayoutConstants.iconMediumSize,
          height: LayoutConstants.iconMediumSize,
        ),
        onChanged: (newValue) {
          if (newValue != null) {
            changeLocale(context, newValue);
          }
          context.router.replace(
            const MainRoute(),
          );
        },
        items: const [
          'en',
          'vi',
        ],
        hintText:
            LocalizedApp.of(context).delegate.currentLocale.languageCode.tr,
      ),
    );
  }
}
