// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductListFilterState {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductListFilterStateCopyWith<ProductListFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListFilterStateCopyWith<$Res> {
  factory $ProductListFilterStateCopyWith(ProductListFilterState value,
          $Res Function(ProductListFilterState) then) =
      _$ProductListFilterStateCopyWithImpl<$Res, ProductListFilterState>;
  @useResult
  $Res call({int page, int size, String? search});
}

/// @nodoc
class _$ProductListFilterStateCopyWithImpl<$Res,
        $Val extends ProductListFilterState>
    implements $ProductListFilterStateCopyWith<$Res> {
  _$ProductListFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? search = freezed,
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
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListFilterStateImplCopyWith<$Res>
    implements $ProductListFilterStateCopyWith<$Res> {
  factory _$$ProductListFilterStateImplCopyWith(
          _$ProductListFilterStateImpl value,
          $Res Function(_$ProductListFilterStateImpl) then) =
      __$$ProductListFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size, String? search});
}

/// @nodoc
class __$$ProductListFilterStateImplCopyWithImpl<$Res>
    extends _$ProductListFilterStateCopyWithImpl<$Res,
        _$ProductListFilterStateImpl>
    implements _$$ProductListFilterStateImplCopyWith<$Res> {
  __$$ProductListFilterStateImplCopyWithImpl(
      _$ProductListFilterStateImpl _value,
      $Res Function(_$ProductListFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? search = freezed,
  }) {
    return _then(_$ProductListFilterStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProductListFilterStateImpl implements _ProductListFilterState {
  const _$ProductListFilterStateImpl(
      {this.page = 1, this.size = 20, this.search});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  final String? search;

  @override
  String toString() {
    return 'ProductListFilterState(page: $page, size: $size, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListFilterStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, size, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListFilterStateImplCopyWith<_$ProductListFilterStateImpl>
      get copyWith => __$$ProductListFilterStateImplCopyWithImpl<
          _$ProductListFilterStateImpl>(this, _$identity);
}

abstract class _ProductListFilterState implements ProductListFilterState {
  const factory _ProductListFilterState(
      {final int page,
      final int size,
      final String? search}) = _$ProductListFilterStateImpl;

  @override
  int get page;
  @override
  int get size;
  @override
  String? get search;
  @override
  @JsonKey(ignore: true)
  _$$ProductListFilterStateImplCopyWith<_$ProductListFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
