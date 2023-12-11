import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../routers/app_router.dart';

class ChangeLanguegeWidget extends StatefulWidget {
  const ChangeLanguegeWidget({super.key});

  @override
  State<ChangeLanguegeWidget> createState() => _ChangeLanguegeWidgetState();
}

class _ChangeLanguegeWidgetState extends State<ChangeLanguegeWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: LocalizedApp.of(context).delegate.currentLocale.languageCode,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24.w,
      elevation: 20,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? newValue) {
        if (newValue != null) {
          changeLocale(context, newValue);
        }
        context.router.pushAndPopUntil(
          const LoginRoute(),
          predicate: (route) => false,
        );
      },
      focusColor: Colors.deepPurple,
      borderRadius: BorderRadius.circular(10.r),
      underline: const SizedBox(),
      items: <String>['en', 'vi'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value.tr),
        );
      }).toList(),
    );
  }
}
