import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../themes/themes.dart';
import '../../../widgets/image_app_widget/image_app.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({
    super.key,
    required this.categoryType,
    required this.data,
  });
  final CategoryType categoryType;
  final Map<CategoryType, num> data;

  @override
  State<StatefulWidget> createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State<PieChartWidget> {
  List<MapEntry<CategoryType, num>> data = [];
  num total = 0;

  @override
  Widget build(BuildContext context) {
    data = widget.data.entries
        .where((element) => element.key.categoryType == widget.categoryType)
        .toList();
    total = data
        .firstWhere(
          (element) => element.key == widget.categoryType,
          orElse: () => MapEntry(widget.categoryType, 0),
        )
        .value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.categoryType.type.tr,
          style: ThemeText.caption,
        ),
        Text(
          (total < 0 ? -total : total).getTextCompactCurrencyAmount,
          style: ThemeText.body1.copyWith(
            color: widget.categoryType.type == CategoryType.expense.type ||
                    widget.categoryType.type == CategoryType.loan.type
                ? AppColor.red
                : AppColor.blue,
          ),
        ),
        SizedBox(
          height: AppDimens.height_20,
        ),
        data.isEmpty
            ? SizedBox(
                height: 130.h,
              )
            : AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: showingSections(),
                  ),
                ),
              ),
        SizedBox(
          height: AppDimens.height_20,
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    final List<PieChartSectionData> sections = [];

    for (int i = 0; i < data.length; i++) {
      if (data[i].key == widget.categoryType) continue;
      sections.add(
        showingSection(
          i,
          data.elementAt(i).key,
          (data.elementAt(i).value / total * 100),
        ),
      );
    }

    return sections;
  }

  PieChartSectionData showingSection(
      int index, CategoryType type, double value) {
    final fontSize = 10.0.sp;
    final radius = 65.sp;
    final widgetSize = 24.sp;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    final color = Colors.primaries[index % Colors.primaries.length];
    return PieChartSectionData(
      color: color,
      value: value,
      title: '  ${value.toStringAsFixed(2)}%',
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
        shadows: shadows,
      ),
      badgeWidget: _Badge(
        "${StringConstants.imagePath}${type.title.toLowerCase()}.png",
        size: widgetSize,
        borderColor: color,
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
      padding: EdgeInsets.all(size * .05),
      child: Center(
        child: AppImageWidget(
          path: svgAsset,
        ),
      ),
    );
  }
}
