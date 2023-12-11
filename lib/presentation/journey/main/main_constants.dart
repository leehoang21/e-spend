import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../account/account_screen.dart';
import '../home/home_screen.dart';

class MainConstants {
  static final floatingActionButtonDimension = 56.sp;
  static final floatingActionButtonIconSize = 52.sp;

  static const screenAnimatingDuration = Duration(milliseconds: 300);

  static final List<Map<String, dynamic>> bottomIconsData = [
    {
      "iconPath": Assets.icons.bottomBarTransactions.path,
      "label": 'transactions',
    },
    // {
    //   "iconPath": IconConstants.bottomBarStatisticIcon,
    //   "label": translate('report'),
    // },
    // {
    //   "iconPath": IconConstants.bottomBarGoalIcon,
    //   "label": translate('wallet'),
    // },
    {
      "iconPath": Assets.icons.bottomBarMyPage.path,
      "label": 'my_page',
    },
  ];

  static final screens = [
    const HomeScreen(),
    //const StatisticCcreenProvider(),
    // WalletList2Screen(),
    const AccountScreen(),
  ];
}
