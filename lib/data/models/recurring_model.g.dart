// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepeatImpl _$$RepeatImplFromJson(Map<String, dynamic> json) => _$RepeatImpl(
      length: json['length'] as int?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      type: $enumDecodeNullable(_$RepeatTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$RepeatImplToJson(_$RepeatImpl instance) =>
    <String, dynamic>{
      'length': instance.length,
      'startTime': instance.startTime?.toIso8601String(),
      'type': _$RepeatTypeEnumMap[instance.type],
    };

const _$RepeatTypeEnumMap = {
  RepeatType.none: 'none',
  RepeatType.daily: 'daily',
  RepeatType.weekly: 'weekly',
  RepeatType.monthly: 'monthly',
  RepeatType.yearly: 'yearly',
};

_$RecurringModelImpl _$$RecurringModelImplFromJson(Map<String, dynamic> json) =>
    _$RecurringModelImpl(
      id: json['id'] as String?,
      category: $enumDecodeNullable(_$CategoryTypeEnumMap, json['category']),
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      note: json['note'] as String?,
      defaultAmount: json['defaultAmount'] as int?,
      repeat: json['repeat'] == null
          ? null
          : Repeat.fromJson(json['repeat'] as Map<String, dynamic>),
      wallet: json['wallet'] == null
          ? null
          : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecurringModelImplToJson(
        _$RecurringModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': _$CategoryTypeEnumMap[instance.category],
      'createAt': instance.createAt?.toIso8601String(),
      'note': instance.note,
      'defaultAmount': instance.defaultAmount,
      'repeat': instance.repeat?.toJson(),
      'wallet': instance.wallet?.toJson(),
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
