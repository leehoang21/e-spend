import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/presentation/journey/planning/planning_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../account/account_screen.dart';
import '../home/home_screen.dart';
import '../statistics/statistic_screen_provider.dart';

class MainConstants {
  static final floatingActionButtonDimension = 56.sp;
  static final floatingActionButtonIconSize = 52.sp;

  static const screenAnimatingDuration = Duration(milliseconds: 300);

  static final List<Map<String, dynamic>> bottomIconsData = [
    {
      "iconPath": Assets.icons.bottomBarTransactions.path,
      "label": 'transactions',
    },
    {
      "iconPath": Assets.icons.bottomBarStatistic.path,
      "label": translate('report'),
    },
    {
      "iconPath": Assets.icons.bottomBarGoal.path,
      "label": translate('planning'),
    },
    {
      "iconPath": Assets.icons.bottomBarMyPage.path,
      "label": 'my_page',
    },
  ];

  static final screens = [
    const HomeScreen(),
    const StatisticScreenProvider(),
    const PlanningScreen(),
    const AccountScreen(),
  ];
}
