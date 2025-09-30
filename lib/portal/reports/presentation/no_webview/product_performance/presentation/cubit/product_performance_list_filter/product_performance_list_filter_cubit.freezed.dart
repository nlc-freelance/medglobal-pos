// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_performance_list_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductPerformanceListFilterState {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  ReportType? get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductPerformanceListFilterStateCopyWith<ProductPerformanceListFilterState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPerformanceListFilterStateCopyWith<$Res> {
  factory $ProductPerformanceListFilterStateCopyWith(
          ProductPerformanceListFilterState value,
          $Res Function(ProductPerformanceListFilterState) then) =
      _$ProductPerformanceListFilterStateCopyWithImpl<$Res,
          ProductPerformanceListFilterState>;
  @useResult
  $Res call({int page, int size, ReportType? type});
}

/// @nodoc
class _$ProductPerformanceListFilterStateCopyWithImpl<$Res,
        $Val extends ProductPerformanceListFilterState>
    implements $ProductPerformanceListFilterStateCopyWith<$Res> {
  _$ProductPerformanceListFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPerformanceListFilterStateImplCopyWith<$Res>
    implements $ProductPerformanceListFilterStateCopyWith<$Res> {
  factory _$$ProductPerformanceListFilterStateImplCopyWith(
          _$ProductPerformanceListFilterStateImpl value,
          $Res Function(_$ProductPerformanceListFilterStateImpl) then) =
      __$$ProductPerformanceListFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size, ReportType? type});
}

/// @nodoc
class __$$ProductPerformanceListFilterStateImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListFilterStateCopyWithImpl<$Res,
        _$ProductPerformanceListFilterStateImpl>
    implements _$$ProductPerformanceListFilterStateImplCopyWith<$Res> {
  __$$ProductPerformanceListFilterStateImplCopyWithImpl(
      _$ProductPerformanceListFilterStateImpl _value,
      $Res Function(_$ProductPerformanceListFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? type = freezed,
  }) {
    return _then(_$ProductPerformanceListFilterStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType?,
    ));
  }
}

/// @nodoc

class _$ProductPerformanceListFilterStateImpl
    implements _ProductPerformanceListFilterState {
  const _$ProductPerformanceListFilterStateImpl(
      {this.page = 1, this.size = 20, this.type});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  final ReportType? type;

  @override
  String toString() {
    return 'ProductPerformanceListFilterState(page: $page, size: $size, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPerformanceListFilterStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, size, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPerformanceListFilterStateImplCopyWith<
          _$ProductPerformanceListFilterStateImpl>
      get copyWith => __$$ProductPerformanceListFilterStateImplCopyWithImpl<
          _$ProductPerformanceListFilterStateImpl>(this, _$identity);
}

abstract class _ProductPerformanceListFilterState
    implements ProductPerformanceListFilterState {
  const factory _ProductPerformanceListFilterState(
      {final int page,
      final int size,
      final ReportType? type}) = _$ProductPerformanceListFilterStateImpl;

  @override
  int get page;
  @override
  int get size;
  @override
  ReportType? get type;
  @override
  @JsonKey(ignore: true)
  _$$ProductPerformanceListFilterStateImplCopyWith<
          _$ProductPerformanceListFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
