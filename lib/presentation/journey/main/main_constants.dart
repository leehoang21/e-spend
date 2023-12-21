import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainConstants {
  static final floatingActionButtonIconSize = 52.sp;

  static const screenAnimatingDuration = Duration(milliseconds: 300);

  static final List<Map<String, dynamic>> bottomIconsData = [
    {
      "iconPath": Assets.images.bottomBarTransactions.path,
      "label": 'transactions',
    },
    {
      "iconPath": Assets.images.bottomBarStatistic.path,
      "label": 'report',
    },
    {
      "iconPath": Assets.icons.bottomBarGoal.path,
      "label": 'planning',
    },
    {
      "iconPath": Assets.images.bottomBarMyPage.path,
      "label": 'my_page',
    },
  ];
}
