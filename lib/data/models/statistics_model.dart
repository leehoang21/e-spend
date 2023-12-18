// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'statistics_model.freezed.dart';

@freezed
class StatisticsListModel with _$StatisticsListModel {
  StatisticsListModel._();

  factory StatisticsListModel({
    Map<int, StatisticsListModel>? subStatistics,
    @Default({
      CategoryType.revenue: 0.0,
      CategoryType.expense: 0.0,
      CategoryType.debt: 0.0,
      CategoryType.loan: 0.0,
    })
    Map<CategoryType, num> data,
  }) = _StatisticsListModel;

  static StatisticsListModel fromJson(Map<String, dynamic> json) {
    return StatisticsListModel(
      subStatistics: (json['subStatistics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k),
            StatisticsListModel.fromJson(e as Map<String, dynamic>)),
      ),
      data: (json['data'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry($enumDecode(_$CategoryTypeEnumMap, k), e as num),
          ) ??
          const {
            CategoryType.revenue: 0.0,
            CategoryType.expense: 0.0,
            CategoryType.debtsAndLoan: 0.0
          },
    );
  }

  Map<String, dynamic> toJson() {
    final _data = data.map((k, e) => MapEntry(_$CategoryTypeEnumMap[k], e));
    _data.removeWhere((key, value) => key == null);
    return <String, dynamic>{
      'subStatistics':
          subStatistics?.map((k, e) => MapEntry(k.toString(), e.toJson())),
      'data': _data,
    };
  }

  static final _$CategoryTypeEnumMap = {
    CategoryType.expense: 'expense',
    CategoryType.revenue: 'revenue',
    CategoryType.debtsAndLoan: 'debtsAndLoan',
    CategoryType.eating: 'eating',
    CategoryType.drinking: 'drinking',
    CategoryType.restaurant: 'restaurant',
    CategoryType.coffee: 'coffee',
    CategoryType.move: 'move',
    CategoryType.maintenance: 'maintenance',
    CategoryType.parking: 'parking',
    CategoryType.taxi: 'taxi',
    CategoryType.oil: 'oil',
    CategoryType.friendAndLover: 'friendAndLover',
    CategoryType.family: 'family',
    CategoryType.children: 'children',
    CategoryType.homeRepair: 'homeRepair',
    CategoryType.homeService: 'homeService',
    CategoryType.pets: 'pets',
    CategoryType.traveling: 'traveling',
    CategoryType.shopping: 'shopping',
    CategoryType.clothes: 'clothes',
    CategoryType.accessory: 'accessory',
    CategoryType.electronicDevice: 'electronicDevice',
    CategoryType.donate: 'donate',
    CategoryType.wedding: 'wedding',
    CategoryType.funeral: 'funeral',
    CategoryType.charity: 'charity',
    CategoryType.billsAndUtilities: 'billsAndUtilities',
    CategoryType.electricBill: 'electricBill',
    CategoryType.rentHouse: 'rentHouse',
    CategoryType.tvBill: 'tvBill',
    CategoryType.gasBill: 'gasBill',
    CategoryType.waterBill: 'waterBill',
    CategoryType.investment: 'investment',
    CategoryType.other: 'other',
    CategoryType.education: 'education',
    CategoryType.book: 'book',
    CategoryType.course: 'course',
    CategoryType.heath: 'heath',
    CategoryType.personalHygiene: 'personalHygiene',
    CategoryType.healthcare: 'healthcare',
    CategoryType.medicine: 'medicine',
    CategoryType.business: 'business',
    CategoryType.sellThings: 'sellThings',
    CategoryType.salary: 'salary',
    CategoryType.bonus: 'bonus',
    CategoryType.livingExpense: 'livingExpense',
    CategoryType.awarded: 'awarded',
    CategoryType.otherRevenue: 'otherRevenue',
    CategoryType.debtCollection: 'debtCollection',
    CategoryType.borrow: 'borrow',
    CategoryType.loan: 'loan',
    CategoryType.pay: 'pay',
    CategoryType.debt: 'debt',
  };
}
