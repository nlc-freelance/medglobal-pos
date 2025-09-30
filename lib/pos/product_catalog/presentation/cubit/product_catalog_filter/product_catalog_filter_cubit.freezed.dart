// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_catalog_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductCatalogFilterState {
  String? get search => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCatalogFilterStateCopyWith<ProductCatalogFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCatalogFilterStateCopyWith<$Res> {
  factory $ProductCatalogFilterStateCopyWith(ProductCatalogFilterState value,
          $Res Function(ProductCatalogFilterState) then) =
      _$ProductCatalogFilterStateCopyWithImpl<$Res, ProductCatalogFilterState>;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class _$ProductCatalogFilterStateCopyWithImpl<$Res,
        $Val extends ProductCatalogFilterState>
    implements $ProductCatalogFilterStateCopyWith<$Res> {
  _$ProductCatalogFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCatalogFilterStateImplCopyWith<$Res>
    implements $ProductCatalogFilterStateCopyWith<$Res> {
  factory _$$ProductCatalogFilterStateImplCopyWith(
          _$ProductCatalogFilterStateImpl value,
          $Res Function(_$ProductCatalogFilterStateImpl) then) =
      __$$ProductCatalogFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? search});
}

/// @nodoc
class __$$ProductCatalogFilterStateImplCopyWithImpl<$Res>
    extends _$ProductCatalogFilterStateCopyWithImpl<$Res,
        _$ProductCatalogFilterStateImpl>
    implements _$$ProductCatalogFilterStateImplCopyWith<$Res> {
  __$$ProductCatalogFilterStateImplCopyWithImpl(
      _$ProductCatalogFilterStateImpl _value,
      $Res Function(_$ProductCatalogFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$ProductCatalogFilterStateImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProductCatalogFilterStateImpl implements _ProductCatalogFilterState {
  const _$ProductCatalogFilterStateImpl({this.search});

  @override
  final String? search;

  @override
  String toString() {
    return 'ProductCatalogFilterState(search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCatalogFilterStateImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCatalogFilterStateImplCopyWith<_$ProductCatalogFilterStateImpl>
      get copyWith => __$$ProductCatalogFilterStateImplCopyWithImpl<
          _$ProductCatalogFilterStateImpl>(this, _$identity);
}

abstract class _ProductCatalogFilterState implements ProductCatalogFilterState {
  const factory _ProductCatalogFilterState({final String? search}) =
      _$ProductCatalogFilterStateImpl;

  @override
  String? get search;
  @override
  @JsonKey(ignore: true)
  _$$ProductCatalogFilterStateImplCopyWith<_$ProductCatalogFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
