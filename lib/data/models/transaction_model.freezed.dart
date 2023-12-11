// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionModel {
  String? get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  int get spendTime => throw _privateConstructorUsedError;
  List<String>? get photos => throw _privateConstructorUsedError;
  WalletModel get wallet => throw _privateConstructorUsedError;
  int get createAt => throw _privateConstructorUsedError;
  int get lastUpdate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {String? id,
      int amount,
      String? note,
      CategoryModel category,
      int spendTime,
      List<String>? photos,
      WalletModel wallet,
      int createAt,
      int lastUpdate});

  $CategoryModelCopyWith<$Res> get category;
  $WalletModelCopyWith<$Res> get wallet;
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = null,
    Object? note = freezed,
    Object? category = null,
    Object? spendTime = null,
    Object? photos = freezed,
    Object? wallet = null,
    Object? createAt = null,
    Object? lastUpdate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      spendTime: null == spendTime
          ? _value.spendTime
          : spendTime // ignore: cast_nullable_to_non_nullable
              as int,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res> get wallet {
    return $WalletModelCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int amount,
      String? note,
      CategoryModel category,
      int spendTime,
      List<String>? photos,
      WalletModel wallet,
      int createAt,
      int lastUpdate});

  @override
  $CategoryModelCopyWith<$Res> get category;
  @override
  $WalletModelCopyWith<$Res> get wallet;
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = null,
    Object? note = freezed,
    Object? category = null,
    Object? spendTime = null,
    Object? photos = freezed,
    Object? wallet = null,
    Object? createAt = null,
    Object? lastUpdate = null,
  }) {
    return _then(_$TransactionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      spendTime: null == spendTime
          ? _value.spendTime
          : spendTime // ignore: cast_nullable_to_non_nullable
              as int,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TransactionModelImpl extends _TransactionModel {
  const _$TransactionModelImpl(
      {this.id,
      required this.amount,
      this.note,
      required this.category,
      required this.spendTime,
      final List<String>? photos,
      required this.wallet,
      required this.createAt,
      required this.lastUpdate})
      : _photos = photos,
        super._();

  @override
  final String? id;
  @override
  final int amount;
  @override
  final String? note;
  @override
  final CategoryModel category;
  @override
  final int spendTime;
  final List<String>? _photos;
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final WalletModel wallet;
  @override
  final int createAt;
  @override
  final int lastUpdate;

  @override
  String toString() {
    return 'TransactionModel(id: $id, amount: $amount, note: $note, category: $category, spendTime: $spendTime, photos: $photos, wallet: $wallet, createAt: $createAt, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.spendTime, spendTime) ||
                other.spendTime == spendTime) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      note,
      category,
      spendTime,
      const DeepCollectionEquality().hash(_photos),
      wallet,
      createAt,
      lastUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);
}

abstract class _TransactionModel extends TransactionModel {
  const factory _TransactionModel(
      {final String? id,
      required final int amount,
      final String? note,
      required final CategoryModel category,
      required final int spendTime,
      final List<String>? photos,
      required final WalletModel wallet,
      required final int createAt,
      required final int lastUpdate}) = _$TransactionModelImpl;
  const _TransactionModel._() : super._();

  @override
  String? get id;
  @override
  int get amount;
  @override
  String? get note;
  @override
  CategoryModel get category;
  @override
  int get spendTime;
  @override
  List<String>? get photos;
  @override
  WalletModel get wallet;
  @override
  int get createAt;
  @override
  int get lastUpdate;
  @override
  @JsonKey(ignore: true)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
