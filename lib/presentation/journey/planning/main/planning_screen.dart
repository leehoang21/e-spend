import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_e_spend/presentation/themes/themes.dart';
import 'package:flutter_e_spend/presentation/widgets/refresh_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';

import 'planning_contants.dart';
import 'widgets/item_planning_widget.dart';

class PlanningScreen extends StatelessWidget {
  const PlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: RefreshWidget(
        enableLoadMore: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              PlanningConstants.title.tr,
              style: ThemeText.style18Bold,
            ),
            SizedBox(height: AppDimens.height_20),
            ItemPlanningWidget(
              icon: Assets.images.icCoin.path,
              title: PlanningConstants.buget.tr,
              subtitle: PlanningConstants.subtitleBuget.tr,
              onTap: () {
                context.pushRoute(const BugetRoute());
              },
            ),
            // ItemPlanningWidget(
            //   icon: Assets.images.icEvent.path,
            //   title: PlanningConstants.event.tr,
            //   subtitle: PlanningConstants.subtitleEvent.tr,
            //   onTap: () {},
            // ),
            ItemPlanningWidget(
              icon: Assets.images.icMoney.path,
              title: PlanningConstants.recurringTransactions.tr,
              subtitle: PlanningConstants.subtitleRecurringTransactions.tr,
              onTap: () {
                context.pushRoute(const RecurringListRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
