// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  String? get id => throw _privateConstructorUsedError;
  String? get walletImage => throw _privateConstructorUsedError;
  String? get walletName => throw _privateConstructorUsedError;
  num? get balance => throw _privateConstructorUsedError;
  num? get firstBalance => throw _privateConstructorUsedError;
  int? get walletType => throw _privateConstructorUsedError;
  int? get createAt => throw _privateConstructorUsedError;
  int? get lastUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call(
      {String? id,
      String? walletImage,
      String? walletName,
      num? balance,
      num? firstBalance,
      int? walletType,
      int? createAt,
      int? lastUpdate});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? walletImage = freezed,
    Object? walletName = freezed,
    Object? balance = freezed,
    Object? firstBalance = freezed,
    Object? walletType = freezed,
    Object? createAt = freezed,
    Object? lastUpdate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      walletImage: freezed == walletImage
          ? _value.walletImage
          : walletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      walletName: freezed == walletName
          ? _value.walletName
          : walletName // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      firstBalance: freezed == firstBalance
          ? _value.firstBalance
          : firstBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      walletType: freezed == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as int?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletModelImplCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$WalletModelImplCopyWith(
          _$WalletModelImpl value, $Res Function(_$WalletModelImpl) then) =
      __$$WalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? walletImage,
      String? walletName,
      num? balance,
      num? firstBalance,
      int? walletType,
      int? createAt,
      int? lastUpdate});
}

/// @nodoc
class __$$WalletModelImplCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$WalletModelImpl>
    implements _$$WalletModelImplCopyWith<$Res> {
  __$$WalletModelImplCopyWithImpl(
      _$WalletModelImpl _value, $Res Function(_$WalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? walletImage = freezed,
    Object? walletName = freezed,
    Object? balance = freezed,
    Object? firstBalance = freezed,
    Object? walletType = freezed,
    Object? createAt = freezed,
    Object? lastUpdate = freezed,
  }) {
    return _then(_$WalletModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      walletImage: freezed == walletImage
          ? _value.walletImage
          : walletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      walletName: freezed == walletName
          ? _value.walletName
          : walletName // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      firstBalance: freezed == firstBalance
          ? _value.firstBalance
          : firstBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      walletType: freezed == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as int?,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletModelImpl extends _WalletModel {
  _$WalletModelImpl(
      {this.id,
      this.walletImage,
      this.walletName,
      this.balance,
      this.firstBalance,
      this.walletType,
      this.createAt,
      this.lastUpdate})
      : super._();

  factory _$WalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? walletImage;
  @override
  final String? walletName;
  @override
  final num? balance;
  @override
  final num? firstBalance;
  @override
  final int? walletType;
  @override
  final int? createAt;
  @override
  final int? lastUpdate;

  @override
  String toString() {
    return 'WalletModel(id: $id, walletImage: $walletImage, walletName: $walletName, balance: $balance, firstBalance: $firstBalance, walletType: $walletType, createAt: $createAt, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletImage, walletImage) ||
                other.walletImage == walletImage) &&
            (identical(other.walletName, walletName) ||
                other.walletName == walletName) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.firstBalance, firstBalance) ||
                other.firstBalance == firstBalance) &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, walletImage, walletName,
      balance, firstBalance, walletType, createAt, lastUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      __$$WalletModelImplCopyWithImpl<_$WalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletModelImplToJson(
      this,
    );
  }
}

abstract class _WalletModel extends WalletModel {
  factory _WalletModel(
      {final String? id,
      final String? walletImage,
      final String? walletName,
      final num? balance,
      final num? firstBalance,
      final int? walletType,
      final int? createAt,
      final int? lastUpdate}) = _$WalletModelImpl;
  _WalletModel._() : super._();

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$WalletModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get walletImage;
  @override
  String? get walletName;
  @override
  num? get balance;
  @override
  num? get firstBalance;
  @override
  int? get walletType;
  @override
  int? get createAt;
  @override
  int? get lastUpdate;
  @override
  @JsonKey(ignore: true)
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
