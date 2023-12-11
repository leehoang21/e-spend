import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_model.freezed.dart';
part 'statistics_model.g.dart';

@freezed
class StatisticsListModel with _$StatisticsListModel {
  factory StatisticsListModel({
    @Default({}) Map<String, StatisticsListModel> statistics,
    @Default({}) Map<String, double> data,
  }) = _StatisticsListModel;

  factory StatisticsListModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsListModelFromJson(json);
}
