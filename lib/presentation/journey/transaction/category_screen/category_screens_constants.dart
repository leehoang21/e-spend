import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CategoryScreenConstants {
  static final String title =
      translate("transaction_category_screen_categories");

  static final String expensesTile =
      translate("transaction_category_screen_expenses");

  static final categoryListViewPadding = EdgeInsets.symmetric(horizontal: 18.w);

  static final tabs = ["EXPENSES", "REVENUE"];
}
