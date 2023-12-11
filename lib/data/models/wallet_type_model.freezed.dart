// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletTypeModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletTypeModelCopyWith<WalletTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTypeModelCopyWith<$Res> {
  factory $WalletTypeModelCopyWith(
          WalletTypeModel value, $Res Function(WalletTypeModel) then) =
      _$WalletTypeModelCopyWithImpl<$Res, WalletTypeModel>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$WalletTypeModelCopyWithImpl<$Res, $Val extends WalletTypeModel>
    implements $WalletTypeModelCopyWith<$Res> {
  _$WalletTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTypeModelImplCopyWith<$Res>
    implements $WalletTypeModelCopyWith<$Res> {
  factory _$$WalletTypeModelImplCopyWith(_$WalletTypeModelImpl value,
          $Res Function(_$WalletTypeModelImpl) then) =
      __$$WalletTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$WalletTypeModelImplCopyWithImpl<$Res>
    extends _$WalletTypeModelCopyWithImpl<$Res, _$WalletTypeModelImpl>
    implements _$$WalletTypeModelImplCopyWith<$Res> {
  __$$WalletTypeModelImplCopyWithImpl(
      _$WalletTypeModelImpl _value, $Res Function(_$WalletTypeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$WalletTypeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WalletTypeModelImpl implements _WalletTypeModel {
  const _$WalletTypeModelImpl({this.id, this.name});

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'WalletTypeModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTypeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTypeModelImplCopyWith<_$WalletTypeModelImpl> get copyWith =>
      __$$WalletTypeModelImplCopyWithImpl<_$WalletTypeModelImpl>(
          this, _$identity);
}

abstract class _WalletTypeModel implements WalletTypeModel {
  const factory _WalletTypeModel({final int? id, final String? name}) =
      _$WalletTypeModelImpl;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$WalletTypeModelImplCopyWith<_$WalletTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
