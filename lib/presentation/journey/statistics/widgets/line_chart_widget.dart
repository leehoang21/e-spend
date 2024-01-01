import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../common/enums/category.dart';
import '../../../themes/themes.dart';
import '../statistic_screen_constants.dart';

class _LineChart extends StatefulWidget {
  const _LineChart(this.data);
  final List<MapEntry<CategoryType, num>> data;

  @override
  State<_LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<_LineChart> {
  double max = 0;
  double number = 1;

  void merge() {
    double expense = 0;
    double revenue = 0;
    for (int i = 0; i < widget.data.length; i++) {
      if (widget.data[i].key.categoryType ==
              CategoryType.expense.categoryType ||
          widget.data[i].key.categoryType == CategoryType.loan.categoryType) {
        expense += widget.data[i].value;
      } else {
        revenue += widget.data[i].value;
      }
    }
    widget.data.clear();
    widget.data.add(MapEntry(CategoryType.expense, -expense));
    widget.data.add(MapEntry(CategoryType.revenue, revenue));
  }

  @override
  Widget build(BuildContext context) {
    //hợp revenue và debt type thành 1
    merge();
    //
    if (widget.data.isNotEmpty) {
      _maxValue();
      _convert();
    }
    return widget.data.isEmpty
        ? const SizedBox()
        : LineChart(
            sampleData,
            duration: const Duration(milliseconds: 250),
          );
  }

  void _maxValue() {
    max = widget.data.first.value.toDouble();
    for (var i = 0; i < widget.data.length; i++) {
      if (widget.data[i].value > max) {
        max = widget.data[i].value.toDouble();
      }
    }
  }

  LineChartData get sampleData {
    return LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData,
      borderData: borderData,
      lineBarsData: lineBarsData,
      minX: 0,
      maxY: widget.data.length.toDouble(),
      minY: 0,
      maxX: 100,
    );
  }

  void _convert() {
    number = 1;
    for (int i = 0; i < max.toStringAsFixed(0).length - 2; i++) {
      number *= 10;
    }
  }

  LineTouchData get lineTouchData => const LineTouchData(
        handleBuiltInTouches: false,
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<LineChartBarData> get lineBarsData => List.generate(
        widget.data.length,
        (index) => lineChartBarData(
          data: FlSpot(
            widget.data[index].value / number,
            (index.toDouble() + 1) / 3,
          ),
          type: widget.data[index].key,
        ),
      );
  //

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: AppDimens.space_12,
    );
    Widget text;
    final val = value.toInt();
    if (val == 0) {
      text = Text('0', style: style);
    } else if (val == 20) {
      text = Text((20 * number).getTextCompactAmount, style: style);
    } else if (val == 40) {
      text = Text((40 * number).getTextCompactAmount, style: style);
    } else if (val == 60) {
      text = Text((60 * number).getTextCompactAmount, style: style);
    } else if (val == 80) {
      text = Text((80 * number).getTextCompactAmount, style: style);
    } else if (val == 100) {
      text = Text((100 * number).getTextCompactAmount, style: style);
    } else {
      text = const SizedBox();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32.h,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: AppColor.black,
          ),
          left: BorderSide(
            color: AppColor.black,
          ),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  Map<CategoryType, Color> get lineChartBarDataColor => {
        CategoryType.expense: AppColor.red,
        CategoryType.revenue: AppColor.blue,
      };

  LineChartBarData lineChartBarData({
    required FlSpot data,
    required CategoryType type,
  }) =>
      LineChartBarData(
        isCurved: true,
        color: lineChartBarDataColor[type.categoryType],
        barWidth: AppDimens.height_20,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: data.x == 0
            ? []
            : [
                data.copyWith(
                  x: 3,
                ),
                data.copyWith(
                  x: data.x > 3 ? data.x : 3,
                ),
              ],
      );
}

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key, required this.data});
  final List<MapEntry<CategoryType, num>> data;

  @override
  State<StatefulWidget> createState() => LineChartWidgetState();
}

class LineChartWidgetState extends State<LineChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  num get _netIncome => widget.data.fold<num>(0, (previousValue, element) {
        return previousValue + element.value;
      });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            StatisticScreenConstant.netIncome.tr,
            style: ThemeText.caption,
          ),
          Text(
            _netIncome.getTextCompactCurrencyAmount,
            style: ThemeText.body1.copyWith(
              color: _netIncome >= 0 ? AppColor.blue : AppColor.red,
            ),
          ),
          SizedBox(
            height: AppDimens.height_20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 6),
              child: _LineChart(
                widget.data,
              ),
            ),
          ),
          SizedBox(
            height: AppDimens.height_12,
          ),
          Row(
            children: [
              Container(
                height: AppDimens.space_16,
                width: AppDimens.space_16,
                color: AppColor.blue,
              ),
              SizedBox(
                width: AppDimens.width_8,
              ),
              Text(
                CategoryType.revenue.type.tr,
                style: ThemeText.caption,
              ),
              SizedBox(
                width: AppDimens.width_16,
              ),
              Container(
                height: AppDimens.space_16,
                width: AppDimens.space_16,
                color: AppColor.red,
              ),
              SizedBox(
                width: AppDimens.width_8,
              ),
              Text(
                CategoryType.expense.type.tr,
                style: ThemeText.caption,
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.height_12,
          ),
          Wrap(
            children: (synbolMoney[LocalizedApp.of(context)
                            .delegate
                            .currentLocale
                            .languageCode]
                        ?.entries ??
                    [])
                .map((e) => Row(
                      children: [
                        Text(
                          '${e.key.length > 1 ? '${e.key} ' : '${e.key}  '}:',
                          style: ThemeText.caption.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: AppDimens.width_8,
                        ),
                        Text(
                          e.value,
                          style: ThemeText.caption,
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Map<String, String> get symbolMoneyVN => {
        'N': 'Nghìn',
        'Tr': 'Triệu',
        'T': 'Tỷ',
      };

  Map<String, String> get symbolMoneyEN => {
        'N': 'Thousand',
        'Tr': 'Million',
        'T': 'Billion',
      };

  Map<String, Map<String, String>> get synbolMoney => {
        'vi': symbolMoneyVN,
        'en': symbolMoneyEN,
      };
}
