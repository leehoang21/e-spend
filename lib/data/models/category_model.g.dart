// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'category': _$CategoryTypeEnumMap[instance.category]!,
      'subCategories': instance.subCategories,
    };

const _$CategoryTypeEnumMap = {
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
