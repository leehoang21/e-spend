import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import 'pie_chart_widget.dart';
import 'statistic_screen_constants.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({Key? key})
      : super(key: key ?? StatisticScreenConstant.key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: PieChartWidget(
                  categoryType: CategoryModel(
                    name: 'REVENUE',
                    type: 'REVENUE',
                  ),
                ),
              ),
              Expanded(
                child: PieChartWidget(
                  categoryType: CategoryModel(
                    name: 'EXPENSES',
                    type: 'EXPENSES',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
