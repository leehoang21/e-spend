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

RecurringModel _$RecurringModelFromJson(Map<String, dynamic> json) {
  return _RecurringModel.fromJson(json);
}

/// @nodoc
mixin _$RecurringModel {
  TransactionModel get transaction => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String get recurringType => throw _privateConstructorUsedError;
  int get recurringCount => throw _privateConstructorUsedError;

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
      {TransactionModel transaction,
      DateTime startDate,
      String recurringType,
      int recurringCount});

  $TransactionModelCopyWith<$Res> get transaction;
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
    Object? transaction = null,
    Object? startDate = null,
    Object? recurringType = null,
    Object? recurringCount = null,
  }) {
    return _then(_value.copyWith(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurringType: null == recurringType
          ? _value.recurringType
          : recurringType // ignore: cast_nullable_to_non_nullable
              as String,
      recurringCount: null == recurringCount
          ? _value.recurringCount
          : recurringCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionModelCopyWith<$Res> get transaction {
    return $TransactionModelCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
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
      {TransactionModel transaction,
      DateTime startDate,
      String recurringType,
      int recurringCount});

  @override
  $TransactionModelCopyWith<$Res> get transaction;
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
    Object? transaction = null,
    Object? startDate = null,
    Object? recurringType = null,
    Object? recurringCount = null,
  }) {
    return _then(_$RecurringModelImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurringType: null == recurringType
          ? _value.recurringType
          : recurringType // ignore: cast_nullable_to_non_nullable
              as String,
      recurringCount: null == recurringCount
          ? _value.recurringCount
          : recurringCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecurringModelImpl implements _RecurringModel {
  const _$RecurringModelImpl(
      {required this.transaction,
      required this.startDate,
      required this.recurringType,
      required this.recurringCount});

  factory _$RecurringModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringModelImplFromJson(json);

  @override
  final TransactionModel transaction;
  @override
  final DateTime startDate;
  @override
  final String recurringType;
  @override
  final int recurringCount;

  @override
  String toString() {
    return 'RecurringModel(transaction: $transaction, startDate: $startDate, recurringType: $recurringType, recurringCount: $recurringCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringModelImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.recurringType, recurringType) ||
                other.recurringType == recurringType) &&
            (identical(other.recurringCount, recurringCount) ||
                other.recurringCount == recurringCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, transaction, startDate, recurringType, recurringCount);

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

abstract class _RecurringModel implements RecurringModel {
  const factory _RecurringModel(
      {required final TransactionModel transaction,
      required final DateTime startDate,
      required final String recurringType,
      required final int recurringCount}) = _$RecurringModelImpl;

  factory _RecurringModel.fromJson(Map<String, dynamic> json) =
      _$RecurringModelImpl.fromJson;

  @override
  TransactionModel get transaction;
  @override
  DateTime get startDate;
  @override
  String get recurringType;
  @override
  int get recurringCount;
  @override
  @JsonKey(ignore: true)
  _$$RecurringModelImplCopyWith<_$RecurringModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
