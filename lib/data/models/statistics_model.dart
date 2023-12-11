import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_model.freezed.dart';
part 'statistics_model.g.dart';

class StatisticsListModel extends Equatable {
  final List<StatisticsModel> list;
  final List<String> keys;

  const StatisticsListModel(this.list, this.keys);

  factory StatisticsListModel.fromJson(Map<String, dynamic> json) {
    return StatisticsListModel(
      json.keys.map((e) {
        return StatisticsModel.fromJson(
          json[e] as Map<String, dynamic>,
        );
      }).toList(),
      json.keys.toList(),
    );
  }

  @override
  List<Object?> get props => [list];
}

@freezed
sealed class StatisticsModel with _$StatisticsModel {
  const factory StatisticsModel({
    required double revenue,
    required double expense,
    required double loan,
    required double debt,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);
}
