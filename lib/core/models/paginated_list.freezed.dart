// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginatedList<T> {
  List<T> get items => throw _privateConstructorUsedError;
  int get currentSize => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedListCopyWith<T, PaginatedList<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedListCopyWith<T, $Res> {
  factory $PaginatedListCopyWith(
          PaginatedList<T> value, $Res Function(PaginatedList<T>) then) =
      _$PaginatedListCopyWithImpl<T, $Res, PaginatedList<T>>;
  @useResult
  $Res call(
      {List<T> items,
      int currentSize,
      int currentPage,
      int totalPages,
      int totalCount});
}

/// @nodoc
class _$PaginatedListCopyWithImpl<T, $Res, $Val extends PaginatedList<T>>
    implements $PaginatedListCopyWith<T, $Res> {
  _$PaginatedListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentSize = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      currentSize: null == currentSize
          ? _value.currentSize
          : currentSize // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedListImplCopyWith<T, $Res>
    implements $PaginatedListCopyWith<T, $Res> {
  factory _$$PaginatedListImplCopyWith(_$PaginatedListImpl<T> value,
          $Res Function(_$PaginatedListImpl<T>) then) =
      __$$PaginatedListImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> items,
      int currentSize,
      int currentPage,
      int totalPages,
      int totalCount});
}

/// @nodoc
class __$$PaginatedListImplCopyWithImpl<T, $Res>
    extends _$PaginatedListCopyWithImpl<T, $Res, _$PaginatedListImpl<T>>
    implements _$$PaginatedListImplCopyWith<T, $Res> {
  __$$PaginatedListImplCopyWithImpl(_$PaginatedListImpl<T> _value,
      $Res Function(_$PaginatedListImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentSize = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalCount = null,
  }) {
    return _then(_$PaginatedListImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      currentSize: null == currentSize
          ? _value.currentSize
          : currentSize // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaginatedListImpl<T> extends _PaginatedList<T> {
  const _$PaginatedListImpl(
      {required final List<T> items,
      required this.currentSize,
      required this.currentPage,
      required this.totalPages,
      required this.totalCount})
      : _items = items,
        super._();

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int currentSize;
  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'PaginatedList<$T>(items: $items, currentSize: $currentSize, currentPage: $currentPage, totalPages: $totalPages, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedListImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.currentSize, currentSize) ||
                other.currentSize == currentSize) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      currentSize,
      currentPage,
      totalPages,
      totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedListImplCopyWith<T, _$PaginatedListImpl<T>> get copyWith =>
      __$$PaginatedListImplCopyWithImpl<T, _$PaginatedListImpl<T>>(
          this, _$identity);
}

abstract class _PaginatedList<T> extends PaginatedList<T> {
  const factory _PaginatedList(
      {required final List<T> items,
      required final int currentSize,
      required final int currentPage,
      required final int totalPages,
      required final int totalCount}) = _$PaginatedListImpl<T>;
  const _PaginatedList._() : super._();

  @override
  List<T> get items;
  @override
  int get currentSize;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedListImplCopyWith<T, _$PaginatedListImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
