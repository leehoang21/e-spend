// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BugetModel {
  List<TransactionModel>? get transactions =>
      throw _privateConstructorUsedError;
  WalletModel? get wallet => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  bool get isAutoCreate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BugetModelCopyWith<BugetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BugetModelCopyWith<$Res> {
  factory $BugetModelCopyWith(
          BugetModel value, $Res Function(BugetModel) then) =
      _$BugetModelCopyWithImpl<$Res, BugetModel>;
  @useResult
  $Res call(
      {List<TransactionModel>? transactions,
      WalletModel? wallet,
      CategoryModel? category,
      double? amount,
      DateTime? time,
      String? id,
      bool isAutoCreate});

  $WalletModelCopyWith<$Res>? get wallet;
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$BugetModelCopyWithImpl<$Res, $Val extends BugetModel>
    implements $BugetModelCopyWith<$Res> {
  _$BugetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
    Object? wallet = freezed,
    Object? category = freezed,
    Object? amount = freezed,
    Object? time = freezed,
    Object? id = freezed,
    Object? isAutoCreate = null,
  }) {
    return _then(_value.copyWith(
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutoCreate: null == isAutoCreate
          ? _value.isAutoCreate
          : isAutoCreate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletModelCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BugetModelImplCopyWith<$Res>
    implements $BugetModelCopyWith<$Res> {
  factory _$$BugetModelImplCopyWith(
          _$BugetModelImpl value, $Res Function(_$BugetModelImpl) then) =
      __$$BugetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionModel>? transactions,
      WalletModel? wallet,
      CategoryModel? category,
      double? amount,
      DateTime? time,
      String? id,
      bool isAutoCreate});

  @override
  $WalletModelCopyWith<$Res>? get wallet;
  @override
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$BugetModelImplCopyWithImpl<$Res>
    extends _$BugetModelCopyWithImpl<$Res, _$BugetModelImpl>
    implements _$$BugetModelImplCopyWith<$Res> {
  __$$BugetModelImplCopyWithImpl(
      _$BugetModelImpl _value, $Res Function(_$BugetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
    Object? wallet = freezed,
    Object? category = freezed,
    Object? amount = freezed,
    Object? time = freezed,
    Object? id = freezed,
    Object? isAutoCreate = null,
  }) {
    return _then(_$BugetModelImpl(
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutoCreate: null == isAutoCreate
          ? _value.isAutoCreate
          : isAutoCreate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BugetModelImpl implements _BugetModel {
  const _$BugetModelImpl(
      {final List<TransactionModel>? transactions,
      this.wallet,
      this.category,
      this.amount,
      this.time,
      this.id,
      this.isAutoCreate = false})
      : _transactions = transactions;

  final List<TransactionModel>? _transactions;
  @override
  List<TransactionModel>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final WalletModel? wallet;
  @override
  final CategoryModel? category;
  @override
  final double? amount;
  @override
  final DateTime? time;
  @override
  final String? id;
  @override
  @JsonKey()
  final bool isAutoCreate;

  @override
  String toString() {
    return 'BugetModel(transactions: $transactions, wallet: $wallet, category: $category, amount: $amount, time: $time, id: $id, isAutoCreate: $isAutoCreate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BugetModelImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAutoCreate, isAutoCreate) ||
                other.isAutoCreate == isAutoCreate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactions),
      wallet,
      category,
      amount,
      time,
      id,
      isAutoCreate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BugetModelImplCopyWith<_$BugetModelImpl> get copyWith =>
      __$$BugetModelImplCopyWithImpl<_$BugetModelImpl>(this, _$identity);
}

abstract class _BugetModel implements BugetModel {
  const factory _BugetModel(
      {final List<TransactionModel>? transactions,
      final WalletModel? wallet,
      final CategoryModel? category,
      final double? amount,
      final DateTime? time,
      final String? id,
      final bool isAutoCreate}) = _$BugetModelImpl;

  @override
  List<TransactionModel>? get transactions;
  @override
  WalletModel? get wallet;
  @override
  CategoryModel? get category;
  @override
  double? get amount;
  @override
  DateTime? get time;
  @override
  String? get id;
  @override
  bool get isAutoCreate;
  @override
  @JsonKey(ignore: true)
  _$$BugetModelImplCopyWith<_$BugetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
