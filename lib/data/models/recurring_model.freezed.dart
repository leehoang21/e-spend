// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Repeat _$RepeatFromJson(Map<String, dynamic> json) {
  return _Repeat.fromJson(json);
}

/// @nodoc
mixin _$Repeat {
  int? get length => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  RepeatType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepeatCopyWith<Repeat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatCopyWith<$Res> {
  factory $RepeatCopyWith(Repeat value, $Res Function(Repeat) then) =
      _$RepeatCopyWithImpl<$Res, Repeat>;
  @useResult
  $Res call({int? length, DateTime? startTime, RepeatType? type});
}

/// @nodoc
class _$RepeatCopyWithImpl<$Res, $Val extends Repeat>
    implements $RepeatCopyWith<$Res> {
  _$RepeatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = freezed,
    Object? startTime = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RepeatType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepeatImplCopyWith<$Res> implements $RepeatCopyWith<$Res> {
  factory _$$RepeatImplCopyWith(
          _$RepeatImpl value, $Res Function(_$RepeatImpl) then) =
      __$$RepeatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? length, DateTime? startTime, RepeatType? type});
}

/// @nodoc
class __$$RepeatImplCopyWithImpl<$Res>
    extends _$RepeatCopyWithImpl<$Res, _$RepeatImpl>
    implements _$$RepeatImplCopyWith<$Res> {
  __$$RepeatImplCopyWithImpl(
      _$RepeatImpl _value, $Res Function(_$RepeatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = freezed,
    Object? startTime = freezed,
    Object? type = freezed,
  }) {
    return _then(_$RepeatImpl(
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RepeatType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepeatImpl extends _Repeat {
  const _$RepeatImpl({this.length, this.startTime, this.type}) : super._();

  factory _$RepeatImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepeatImplFromJson(json);

  @override
  final int? length;
  @override
  final DateTime? startTime;
  @override
  final RepeatType? type;

  @override
  String toString() {
    return 'Repeat(length: $length, startTime: $startTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepeatImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, length, startTime, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepeatImplCopyWith<_$RepeatImpl> get copyWith =>
      __$$RepeatImplCopyWithImpl<_$RepeatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepeatImplToJson(
      this,
    );
  }
}

abstract class _Repeat extends Repeat {
  const factory _Repeat(
      {final int? length,
      final DateTime? startTime,
      final RepeatType? type}) = _$RepeatImpl;
  const _Repeat._() : super._();

  factory _Repeat.fromJson(Map<String, dynamic> json) = _$RepeatImpl.fromJson;

  @override
  int? get length;
  @override
  DateTime? get startTime;
  @override
  RepeatType? get type;
  @override
  @JsonKey(ignore: true)
  _$$RepeatImplCopyWith<_$RepeatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecurringModel _$RecurringModelFromJson(Map<String, dynamic> json) {
  return _RecurringModel.fromJson(json);
}

/// @nodoc
mixin _$RecurringModel {
  String? get id => throw _privateConstructorUsedError;
  CategoryType? get category => throw _privateConstructorUsedError;
  DateTime? get createAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  int? get defaultAmount => throw _privateConstructorUsedError;
  Repeat? get repeat => throw _privateConstructorUsedError;
  WalletModel? get wallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecurringModelCopyWith<RecurringModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringModelCopyWith<$Res> {
  factory $RecurringModelCopyWith(
          RecurringModel value, $Res Function(RecurringModel) then) =
      _$RecurringModelCopyWithImpl<$Res, RecurringModel>;
  @useResult
  $Res call(
      {String? id,
      CategoryType? category,
      DateTime? createAt,
      String? note,
      int? defaultAmount,
      Repeat? repeat,
      WalletModel? wallet});

  $RepeatCopyWith<$Res>? get repeat;
  $WalletModelCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$RecurringModelCopyWithImpl<$Res, $Val extends RecurringModel>
    implements $RecurringModelCopyWith<$Res> {
  _$RecurringModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? createAt = freezed,
    Object? note = freezed,
    Object? defaultAmount = freezed,
    Object? repeat = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryType?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAmount: freezed == defaultAmount
          ? _value.defaultAmount
          : defaultAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as Repeat?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RepeatCopyWith<$Res>? get repeat {
    if (_value.repeat == null) {
      return null;
    }

    return $RepeatCopyWith<$Res>(_value.repeat!, (value) {
      return _then(_value.copyWith(repeat: value) as $Val);
    });
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
}

/// @nodoc
abstract class _$$RecurringModelImplCopyWith<$Res>
    implements $RecurringModelCopyWith<$Res> {
  factory _$$RecurringModelImplCopyWith(_$RecurringModelImpl value,
          $Res Function(_$RecurringModelImpl) then) =
      __$$RecurringModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      CategoryType? category,
      DateTime? createAt,
      String? note,
      int? defaultAmount,
      Repeat? repeat,
      WalletModel? wallet});

  @override
  $RepeatCopyWith<$Res>? get repeat;
  @override
  $WalletModelCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$RecurringModelImplCopyWithImpl<$Res>
    extends _$RecurringModelCopyWithImpl<$Res, _$RecurringModelImpl>
    implements _$$RecurringModelImplCopyWith<$Res> {
  __$$RecurringModelImplCopyWithImpl(
      _$RecurringModelImpl _value, $Res Function(_$RecurringModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? createAt = freezed,
    Object? note = freezed,
    Object? defaultAmount = freezed,
    Object? repeat = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_$RecurringModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryType?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAmount: freezed == defaultAmount
          ? _value.defaultAmount
          : defaultAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as Repeat?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecurringModelImpl extends _RecurringModel {
  const _$RecurringModelImpl(
      {this.id,
      this.category,
      this.createAt,
      this.note,
      this.defaultAmount,
      this.repeat,
      this.wallet})
      : super._();

  factory _$RecurringModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringModelImplFromJson(json);

  @override
  final String? id;
  @override
  final CategoryType? category;
  @override
  final DateTime? createAt;
  @override
  final String? note;
  @override
  final int? defaultAmount;
  @override
  final Repeat? repeat;
  @override
  final WalletModel? wallet;

  @override
  String toString() {
    return 'RecurringModel(id: $id, category: $category, createAt: $createAt, note: $note, defaultAmount: $defaultAmount, repeat: $repeat, wallet: $wallet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.defaultAmount, defaultAmount) ||
                other.defaultAmount == defaultAmount) &&
            (identical(other.repeat, repeat) || other.repeat == repeat) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, category, createAt, note, defaultAmount, repeat, wallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringModelImplCopyWith<_$RecurringModelImpl> get copyWith =>
      __$$RecurringModelImplCopyWithImpl<_$RecurringModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurringModelImplToJson(
      this,
    );
  }
}

abstract class _RecurringModel extends RecurringModel {
  const factory _RecurringModel(
      {final String? id,
      final CategoryType? category,
      final DateTime? createAt,
      final String? note,
      final int? defaultAmount,
      final Repeat? repeat,
      final WalletModel? wallet}) = _$RecurringModelImpl;
  const _RecurringModel._() : super._();

  factory _RecurringModel.fromJson(Map<String, dynamic> json) =
      _$RecurringModelImpl.fromJson;

  @override
  String? get id;
  @override
  CategoryType? get category;
  @override
  DateTime? get createAt;
  @override
  String? get note;
  @override
  int? get defaultAmount;
  @override
  Repeat? get repeat;
  @override
  WalletModel? get wallet;
  @override
  @JsonKey(ignore: true)
  _$$RecurringModelImplCopyWith<_$RecurringModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
