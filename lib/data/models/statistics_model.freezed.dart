// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatisticsListModel _$StatisticsListModelFromJson(Map<String, dynamic> json) {
  return _StatisticsListModel.fromJson(json);
}

/// @nodoc
mixin _$StatisticsListModel {
  Map<String, StatisticsListModel> get statistics =>
      throw _privateConstructorUsedError;
  Map<String, double> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsListModelCopyWith<StatisticsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsListModelCopyWith<$Res> {
  factory $StatisticsListModelCopyWith(
          StatisticsListModel value, $Res Function(StatisticsListModel) then) =
      _$StatisticsListModelCopyWithImpl<$Res, StatisticsListModel>;
  @useResult
  $Res call(
      {Map<String, StatisticsListModel> statistics, Map<String, double> data});
}

/// @nodoc
class _$StatisticsListModelCopyWithImpl<$Res, $Val extends StatisticsListModel>
    implements $StatisticsListModelCopyWith<$Res> {
  _$StatisticsListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Map<String, StatisticsListModel>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsListModelImplCopyWith<$Res>
    implements $StatisticsListModelCopyWith<$Res> {
  factory _$$StatisticsListModelImplCopyWith(_$StatisticsListModelImpl value,
          $Res Function(_$StatisticsListModelImpl) then) =
      __$$StatisticsListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, StatisticsListModel> statistics, Map<String, double> data});
}

/// @nodoc
class __$$StatisticsListModelImplCopyWithImpl<$Res>
    extends _$StatisticsListModelCopyWithImpl<$Res, _$StatisticsListModelImpl>
    implements _$$StatisticsListModelImplCopyWith<$Res> {
  __$$StatisticsListModelImplCopyWithImpl(_$StatisticsListModelImpl _value,
      $Res Function(_$StatisticsListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = null,
    Object? data = null,
  }) {
    return _then(_$StatisticsListModelImpl(
      statistics: null == statistics
          ? _value._statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Map<String, StatisticsListModel>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticsListModelImpl implements _StatisticsListModel {
  _$StatisticsListModelImpl(
      {final Map<String, StatisticsListModel> statistics = const {},
      final Map<String, double> data = const {}})
      : _statistics = statistics,
        _data = data;

  factory _$StatisticsListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsListModelImplFromJson(json);

  final Map<String, StatisticsListModel> _statistics;
  @override
  @JsonKey()
  Map<String, StatisticsListModel> get statistics {
    if (_statistics is EqualUnmodifiableMapView) return _statistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statistics);
  }

  final Map<String, double> _data;
  @override
  @JsonKey()
  Map<String, double> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'StatisticsListModel(statistics: $statistics, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._statistics, _statistics) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_statistics),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsListModelImplCopyWith<_$StatisticsListModelImpl> get copyWith =>
      __$$StatisticsListModelImplCopyWithImpl<_$StatisticsListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsListModelImplToJson(
      this,
    );
  }
}

abstract class _StatisticsListModel implements StatisticsListModel {
  factory _StatisticsListModel(
      {final Map<String, StatisticsListModel> statistics,
      final Map<String, double> data}) = _$StatisticsListModelImpl;

  factory _StatisticsListModel.fromJson(Map<String, dynamic> json) =
      _$StatisticsListModelImpl.fromJson;

  @override
  Map<String, StatisticsListModel> get statistics;
  @override
  Map<String, double> get data;
  @override
  @JsonKey(ignore: true)
  _$$StatisticsListModelImplCopyWith<_$StatisticsListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
