import 'package:flutter/material.dart';

import 'pie_chart_widget.dart';
import 'statistic_screen_constants.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({Key? key})
      : super(key: key ?? StatisticScreenConstant.key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return const Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: PieChartWidget(
                    categoryType: 'REVENUE',
                  ),
                ),
                Expanded(
                  child: PieChartWidget(
                    categoryType: 'EXPENSES',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
