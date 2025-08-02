// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_list_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SupplierListFilterState {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SupplierListFilterStateCopyWith<SupplierListFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierListFilterStateCopyWith<$Res> {
  factory $SupplierListFilterStateCopyWith(SupplierListFilterState value,
          $Res Function(SupplierListFilterState) then) =
      _$SupplierListFilterStateCopyWithImpl<$Res, SupplierListFilterState>;
  @useResult
  $Res call({int page, int size, String? search});
}

/// @nodoc
class _$SupplierListFilterStateCopyWithImpl<$Res,
        $Val extends SupplierListFilterState>
    implements $SupplierListFilterStateCopyWith<$Res> {
  _$SupplierListFilterStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SupplierListFilterStateImplCopyWith<$Res>
    implements $SupplierListFilterStateCopyWith<$Res> {
  factory _$$SupplierListFilterStateImplCopyWith(
          _$SupplierListFilterStateImpl value,
          $Res Function(_$SupplierListFilterStateImpl) then) =
      __$$SupplierListFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size, String? search});
}

/// @nodoc
class __$$SupplierListFilterStateImplCopyWithImpl<$Res>
    extends _$SupplierListFilterStateCopyWithImpl<$Res,
        _$SupplierListFilterStateImpl>
    implements _$$SupplierListFilterStateImplCopyWith<$Res> {
  __$$SupplierListFilterStateImplCopyWithImpl(
      _$SupplierListFilterStateImpl _value,
      $Res Function(_$SupplierListFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? search = freezed,
  }) {
    return _then(_$SupplierListFilterStateImpl(
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

class _$SupplierListFilterStateImpl implements _SupplierListFilterState {
  const _$SupplierListFilterStateImpl(
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
    return 'SupplierListFilterState(page: $page, size: $size, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplierListFilterStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, size, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplierListFilterStateImplCopyWith<_$SupplierListFilterStateImpl>
      get copyWith => __$$SupplierListFilterStateImplCopyWithImpl<
          _$SupplierListFilterStateImpl>(this, _$identity);
}

abstract class _SupplierListFilterState implements SupplierListFilterState {
  const factory _SupplierListFilterState(
      {final int page,
      final int size,
      final String? search}) = _$SupplierListFilterStateImpl;

  @override
  int get page;
  @override
  int get size;
  @override
  String? get search;
  @override
  @JsonKey(ignore: true)
  _$$SupplierListFilterStateImplCopyWith<_$SupplierListFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
