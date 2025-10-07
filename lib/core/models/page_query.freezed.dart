// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageQuery {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extra => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageQueryCopyWith<PageQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageQueryCopyWith<$Res> {
  factory $PageQueryCopyWith(PageQuery value, $Res Function(PageQuery) then) =
      _$PageQueryCopyWithImpl<$Res, PageQuery>;
  @useResult
  $Res call({int page, int size, String? search, Map<String, dynamic>? extra});
}

/// @nodoc
class _$PageQueryCopyWithImpl<$Res, $Val extends PageQuery>
    implements $PageQueryCopyWith<$Res> {
  _$PageQueryCopyWithImpl(this._value, this._then);

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
    Object? extra = freezed,
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
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageQueryImplCopyWith<$Res>
    implements $PageQueryCopyWith<$Res> {
  factory _$$PageQueryImplCopyWith(
          _$PageQueryImpl value, $Res Function(_$PageQueryImpl) then) =
      __$$PageQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size, String? search, Map<String, dynamic>? extra});
}

/// @nodoc
class __$$PageQueryImplCopyWithImpl<$Res>
    extends _$PageQueryCopyWithImpl<$Res, _$PageQueryImpl>
    implements _$$PageQueryImplCopyWith<$Res> {
  __$$PageQueryImplCopyWithImpl(
      _$PageQueryImpl _value, $Res Function(_$PageQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? search = freezed,
    Object? extra = freezed,
  }) {
    return _then(_$PageQueryImpl(
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
      extra: freezed == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$PageQueryImpl implements _PageQuery {
  const _$PageQueryImpl(
      {this.page = 1,
      this.size = 20,
      this.search,
      final Map<String, dynamic>? extra})
      : _extra = extra;

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  final String? search;
  final Map<String, dynamic>? _extra;
  @override
  Map<String, dynamic>? get extra {
    final value = _extra;
    if (value == null) return null;
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PageQuery(page: $page, size: $size, search: $search, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageQueryImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other._extra, _extra));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, size, search,
      const DeepCollectionEquality().hash(_extra));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageQueryImplCopyWith<_$PageQueryImpl> get copyWith =>
      __$$PageQueryImplCopyWithImpl<_$PageQueryImpl>(this, _$identity);
}

abstract class _PageQuery implements PageQuery {
  const factory _PageQuery(
      {final int page,
      final int size,
      final String? search,
      final Map<String, dynamic>? extra}) = _$PageQueryImpl;

  @override
  int get page;
  @override
  int get size;
  @override
  String? get search;
  @override
  Map<String, dynamic>? get extra;
  @override
  @JsonKey(ignore: true)
  _$$PageQueryImplCopyWith<_$PageQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
