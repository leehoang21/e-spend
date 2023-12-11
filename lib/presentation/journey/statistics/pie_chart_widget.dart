import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/transaction_model.dart';
import '../../widgets/image_app_widget/image_app.dart';
import 'cubit/statistic_cubit.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key, required this.categoryType});
  final String categoryType;

  @override
  State<StatefulWidget> createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections:
                showingSections(context.watch<StatisticCubit>().state.data),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(List<TransactionModel> datas) {
    final List<PieChartSectionData> sections = [];
    for (int i = 0; i < datas.length; i++) {
      if (datas[i].category.type == widget.categoryType) {
        sections.add(showingSection(i));
      }
    }
    return sections;
  }

  PieChartSectionData showingSection(int index) {
    final isTouched = index == touchedIndex;
    final fontSize = isTouched ? 20.0.sp : 16.0.sp;
    final radius = isTouched ? 110.0.r : 100.0.r;
    final widgetSize = isTouched ? 55.0.sp : 40.0.sp;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    return PieChartSectionData(
      color: Colors.primaries.length < index
          ? Colors.primaries[index]
          : Colors.amber,
      value: context.watch<StatisticCubit>().revenue(index),
      title: '${context.watch<StatisticCubit>().revenue(index)}%',
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
        shadows: shadows,
      ),
      badgeWidget: _Badge(
        "${StringConstants.imagePath}${context.watch<StatisticCubit>().state.data[index].category.name?.toLowerCase()}.png",
        size: widgetSize,
        borderColor: Colors.black,
      ),
      badgePositionPercentageOffset: .98,
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: AppImageWidget(
          path: svgAsset,
        ),
      ),
    );
  }
}
