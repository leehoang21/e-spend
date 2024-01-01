// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankInfoModel _$BankInfoModelFromJson(Map<String, dynamic> json) {
  return _BankInfoModel.fromJson(json);
}

/// @nodoc
mixin _$BankInfoModel {
  int? get id => throw _privateConstructorUsedError;
  String? get bin => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  int? get isTransfer => throw _privateConstructorUsedError;
  String? get shortName => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  int? get support => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankInfoModelCopyWith<BankInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInfoModelCopyWith<$Res> {
  factory $BankInfoModelCopyWith(
          BankInfoModel value, $Res Function(BankInfoModel) then) =
      _$BankInfoModelCopyWithImpl<$Res, BankInfoModel>;
  @useResult
  $Res call(
      {int? id,
      String? bin,
      String? code,
      int? isTransfer,
      String? shortName,
      String? logo,
      int? support,
      String? name});
}

/// @nodoc
class _$BankInfoModelCopyWithImpl<$Res, $Val extends BankInfoModel>
    implements $BankInfoModelCopyWith<$Res> {
  _$BankInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bin = freezed,
    Object? code = freezed,
    Object? isTransfer = freezed,
    Object? shortName = freezed,
    Object? logo = freezed,
    Object? support = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bin: freezed == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isTransfer: freezed == isTransfer
          ? _value.isTransfer
          : isTransfer // ignore: cast_nullable_to_non_nullable
              as int?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      support: freezed == support
          ? _value.support
          : support // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankInfoModelImplCopyWith<$Res>
    implements $BankInfoModelCopyWith<$Res> {
  factory _$$BankInfoModelImplCopyWith(
          _$BankInfoModelImpl value, $Res Function(_$BankInfoModelImpl) then) =
      __$$BankInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? bin,
      String? code,
      int? isTransfer,
      String? shortName,
      String? logo,
      int? support,
      String? name});
}

/// @nodoc
class __$$BankInfoModelImplCopyWithImpl<$Res>
    extends _$BankInfoModelCopyWithImpl<$Res, _$BankInfoModelImpl>
    implements _$$BankInfoModelImplCopyWith<$Res> {
  __$$BankInfoModelImplCopyWithImpl(
      _$BankInfoModelImpl _value, $Res Function(_$BankInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bin = freezed,
    Object? code = freezed,
    Object? isTransfer = freezed,
    Object? shortName = freezed,
    Object? logo = freezed,
    Object? support = freezed,
    Object? name = freezed,
  }) {
    return _then(_$BankInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bin: freezed == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isTransfer: freezed == isTransfer
          ? _value.isTransfer
          : isTransfer // ignore: cast_nullable_to_non_nullable
              as int?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      support: freezed == support
          ? _value.support
          : support // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankInfoModelImpl implements _BankInfoModel {
  const _$BankInfoModelImpl(
      {this.id,
      this.bin,
      this.code,
      this.isTransfer,
      this.shortName,
      this.logo,
      this.support,
      this.name});

  factory _$BankInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankInfoModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? bin;
  @override
  final String? code;
  @override
  final int? isTransfer;
  @override
  final String? shortName;
  @override
  final String? logo;
  @override
  final int? support;
  @override
  final String? name;

  @override
  String toString() {
    return 'BankInfoModel(id: $id, bin: $bin, code: $code, isTransfer: $isTransfer, shortName: $shortName, logo: $logo, support: $support, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isTransfer, isTransfer) ||
                other.isTransfer == isTransfer) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.support, support) || other.support == support) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, bin, code, isTransfer, shortName, logo, support, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankInfoModelImplCopyWith<_$BankInfoModelImpl> get copyWith =>
      __$$BankInfoModelImplCopyWithImpl<_$BankInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankInfoModelImplToJson(
      this,
    );
  }
}

abstract class _BankInfoModel implements BankInfoModel {
  const factory _BankInfoModel(
      {final int? id,
      final String? bin,
      final String? code,
      final int? isTransfer,
      final String? shortName,
      final String? logo,
      final int? support,
      final String? name}) = _$BankInfoModelImpl;

  factory _BankInfoModel.fromJson(Map<String, dynamic> json) =
      _$BankInfoModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get bin;
  @override
  String? get code;
  @override
  int? get isTransfer;
  @override
  String? get shortName;
  @override
  String? get logo;
  @override
  int? get support;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$BankInfoModelImplCopyWith<_$BankInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
