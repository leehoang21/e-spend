// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/data/models/category_model.dart';

class StatisticsListModel extends Equatable {
  final Map<String, StatisticsListModel> statistics;
  final Map<CategoryModel, Map<CategoryModel, double>> data;

  const StatisticsListModel({
    required this.statistics,
    required this.data,
  });

  factory StatisticsListModel.initial() {
    return const StatisticsListModel(
      statistics: {},
      data: {},
    );
  }

  factory StatisticsListModel.fromJson(Map<String, dynamic> json) {
    final Map<CategoryModel, Map<CategoryModel, double>> data = {};

    if (json['data_keys'] != null) {
      final keys = (json['data_keys'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();

      final Map<CategoryModel, double> values = {};

      final dataValues = (json['data_values'] as List<dynamic>);
      for (int i = 0; i < dataValues.length; i++) {
        final _keys = (dataValues[i]['keys'] as List<dynamic>)
            .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
            .toList();
        final _values = (dataValues[i]['values'] as List<dynamic>)
            .map((e) => e as double)
            .toList();
        for (int i = 0; i < keys.length; i++) {
          values[_keys[i]] = _values[i];
        }
      }
      for (int i = 0; i < keys.length; i++) {
        data[keys[i]] = values;
      }
    }
    return StatisticsListModel(
      statistics: json['statistics'] != null
          ? (json['statistics'] as Map<String, dynamic>).map((key, value) {
              return MapEntry(key, StatisticsListModel.fromJson(value));
            })
          : {},
      data: data,
    );
  }

  Map<String, dynamic> toJson() {
    final keys = data.keys.toList();
    final values = data.values.toList();
    final dataValues = {};
    for (int i = 0; i < values.length; i++) {
      dataValues['keys'] = values[i].keys.toList();
      dataValues['values'] = values[i].values.toList();
    }
    return {
      'statistics':
          statistics.map((key, value) => MapEntry(key, value.toJson())),
      'data_keys': keys.map((e) => e.toJson()).toList(),
      'data_values': values.map((e) {
        return {
          'keys': e.keys.map((e) => e.toJson()).toList(),
          'values': e.values.toList(),
        };
      }).toList(),
    };
  }

  StatisticsListModel copyWith({
    Map<String, StatisticsListModel>? statistics,
    Map<CategoryModel, Map<CategoryModel, double>>? data,
  }) {
    return StatisticsListModel(
      statistics: statistics ?? this.statistics,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [statistics, data];
}
