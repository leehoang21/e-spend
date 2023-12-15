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

/// @nodoc
mixin _$StatisticsListModel {
  Map<int, StatisticsListModel>? get subStatistics =>
      throw _privateConstructorUsedError;
  Map<CategoryType, num> get data => throw _privateConstructorUsedError;

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
      {Map<int, StatisticsListModel>? subStatistics,
      Map<CategoryType, num> data});
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
    Object? subStatistics = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      subStatistics: freezed == subStatistics
          ? _value.subStatistics
          : subStatistics // ignore: cast_nullable_to_non_nullable
              as Map<int, StatisticsListModel>?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<CategoryType, num>,
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
      {Map<int, StatisticsListModel>? subStatistics,
      Map<CategoryType, num> data});
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
    Object? subStatistics = freezed,
    Object? data = null,
  }) {
    return _then(_$StatisticsListModelImpl(
      subStatistics: freezed == subStatistics
          ? _value._subStatistics
          : subStatistics // ignore: cast_nullable_to_non_nullable
              as Map<int, StatisticsListModel>?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<CategoryType, num>,
    ));
  }
}

/// @nodoc

class _$StatisticsListModelImpl extends _StatisticsListModel {
  _$StatisticsListModelImpl(
      {final Map<int, StatisticsListModel>? subStatistics,
      final Map<CategoryType, num> data = const {
        CategoryType.revenue: 0.0,
        CategoryType.expense: 0.0,
        CategoryType.debt: 0.0,
        CategoryType.loan: 0.0
      }})
      : _subStatistics = subStatistics,
        _data = data,
        super._();

  final Map<int, StatisticsListModel>? _subStatistics;
  @override
  Map<int, StatisticsListModel>? get subStatistics {
    final value = _subStatistics;
    if (value == null) return null;
    if (_subStatistics is EqualUnmodifiableMapView) return _subStatistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<CategoryType, num> _data;
  @override
  @JsonKey()
  Map<CategoryType, num> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'StatisticsListModel(subStatistics: $subStatistics, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._subStatistics, _subStatistics) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subStatistics),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsListModelImplCopyWith<_$StatisticsListModelImpl> get copyWith =>
      __$$StatisticsListModelImplCopyWithImpl<_$StatisticsListModelImpl>(
          this, _$identity);
}

abstract class _StatisticsListModel extends StatisticsListModel {
  factory _StatisticsListModel(
      {final Map<int, StatisticsListModel>? subStatistics,
      final Map<CategoryType, num> data}) = _$StatisticsListModelImpl;
  _StatisticsListModel._() : super._();

  @override
  Map<int, StatisticsListModel>? get subStatistics;
  @override
  Map<CategoryType, num> get data;
  @override
  @JsonKey(ignore: true)
  _$$StatisticsListModelImplCopyWith<_$StatisticsListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
