// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lazy_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LazyListEvent<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh, FilterQuery? filters) fetch,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh, FilterQuery? filters)? fetch,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh, FilterQuery? filters)? fetch,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch<T> value) fetch,
    required TResult Function(_Reset<T> value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch<T> value)? fetch,
    TResult? Function(_Reset<T> value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch<T> value)? fetch,
    TResult Function(_Reset<T> value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LazyListEventCopyWith<T, $Res> {
  factory $LazyListEventCopyWith(
          LazyListEvent<T> value, $Res Function(LazyListEvent<T>) then) =
      _$LazyListEventCopyWithImpl<T, $Res, LazyListEvent<T>>;
}

/// @nodoc
class _$LazyListEventCopyWithImpl<T, $Res, $Val extends LazyListEvent<T>>
    implements $LazyListEventCopyWith<T, $Res> {
  _$LazyListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<T, $Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl<T> value, $Res Function(_$FetchImpl<T>) then) =
      __$$FetchImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool forceRefresh, FilterQuery? filters});

  $FilterQueryCopyWith<$Res>? get filters;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<T, $Res>
    extends _$LazyListEventCopyWithImpl<T, $Res, _$FetchImpl<T>>
    implements _$$FetchImplCopyWith<T, $Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl<T> _value, $Res Function(_$FetchImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceRefresh = null,
    Object? filters = freezed,
  }) {
    return _then(_$FetchImpl<T>(
      forceRefresh: null == forceRefresh
          ? _value.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FilterQuery?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterQueryCopyWith<$Res>? get filters {
    if (_value.filters == null) {
      return null;
    }

    return $FilterQueryCopyWith<$Res>(_value.filters!, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc

class _$FetchImpl<T> implements _Fetch<T> {
  const _$FetchImpl({this.forceRefresh = false, this.filters});

  @override
  @JsonKey()
  final bool forceRefresh;
  @override
  final FilterQuery? filters;

  @override
  String toString() {
    return 'LazyListEvent<$T>.fetch(forceRefresh: $forceRefresh, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl<T> &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh) &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceRefresh, filters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<T, _$FetchImpl<T>> get copyWith =>
      __$$FetchImplCopyWithImpl<T, _$FetchImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh, FilterQuery? filters) fetch,
    required TResult Function() reset,
  }) {
    return fetch(forceRefresh, filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh, FilterQuery? filters)? fetch,
    TResult? Function()? reset,
  }) {
    return fetch?.call(forceRefresh, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh, FilterQuery? filters)? fetch,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(forceRefresh, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch<T> value) fetch,
    required TResult Function(_Reset<T> value) reset,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch<T> value)? fetch,
    TResult? Function(_Reset<T> value)? reset,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch<T> value)? fetch,
    TResult Function(_Reset<T> value)? reset,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch<T> implements LazyListEvent<T> {
  const factory _Fetch({final bool forceRefresh, final FilterQuery? filters}) =
      _$FetchImpl<T>;

  bool get forceRefresh;
  FilterQuery? get filters;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<T, _$FetchImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<T, $Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl<T> value, $Res Function(_$ResetImpl<T>) then) =
      __$$ResetImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<T, $Res>
    extends _$LazyListEventCopyWithImpl<T, $Res, _$ResetImpl<T>>
    implements _$$ResetImplCopyWith<T, $Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl<T> _value, $Res Function(_$ResetImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl<T> implements _Reset<T> {
  const _$ResetImpl();

  @override
  String toString() {
    return 'LazyListEvent<$T>.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh, FilterQuery? filters) fetch,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh, FilterQuery? filters)? fetch,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh, FilterQuery? filters)? fetch,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch<T> value) fetch,
    required TResult Function(_Reset<T> value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch<T> value)? fetch,
    TResult? Function(_Reset<T> value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch<T> value)? fetch,
    TResult Function(_Reset<T> value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset<T> implements LazyListEvent<T> {
  const factory _Reset() = _$ResetImpl<T>;
}

/// @nodoc
mixin _$LazyListState<T> {
  List<T> get items => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  bool get hasNoData => throw _privateConstructorUsedError;
  bool get isLoadingInitial => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LazyListStateCopyWith<T, LazyListState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LazyListStateCopyWith<T, $Res> {
  factory $LazyListStateCopyWith(
          LazyListState<T> value, $Res Function(LazyListState<T>) then) =
      _$LazyListStateCopyWithImpl<T, $Res, LazyListState<T>>;
  @useResult
  $Res call(
      {List<T> items,
      bool hasReachedMax,
      bool hasNoData,
      bool isLoadingInitial,
      bool isLoadingMore,
      String? error});
}

/// @nodoc
class _$LazyListStateCopyWithImpl<T, $Res, $Val extends LazyListState<T>>
    implements $LazyListStateCopyWith<T, $Res> {
  _$LazyListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasReachedMax = null,
    Object? hasNoData = null,
    Object? isLoadingInitial = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNoData: null == hasNoData
          ? _value.hasNoData
          : hasNoData // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingInitial: null == isLoadingInitial
          ? _value.isLoadingInitial
          : isLoadingInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LazyListStateImplCopyWith<T, $Res>
    implements $LazyListStateCopyWith<T, $Res> {
  factory _$$LazyListStateImplCopyWith(_$LazyListStateImpl<T> value,
          $Res Function(_$LazyListStateImpl<T>) then) =
      __$$LazyListStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> items,
      bool hasReachedMax,
      bool hasNoData,
      bool isLoadingInitial,
      bool isLoadingMore,
      String? error});
}

/// @nodoc
class __$$LazyListStateImplCopyWithImpl<T, $Res>
    extends _$LazyListStateCopyWithImpl<T, $Res, _$LazyListStateImpl<T>>
    implements _$$LazyListStateImplCopyWith<T, $Res> {
  __$$LazyListStateImplCopyWithImpl(_$LazyListStateImpl<T> _value,
      $Res Function(_$LazyListStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasReachedMax = null,
    Object? hasNoData = null,
    Object? isLoadingInitial = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
  }) {
    return _then(_$LazyListStateImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNoData: null == hasNoData
          ? _value.hasNoData
          : hasNoData // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingInitial: null == isLoadingInitial
          ? _value.isLoadingInitial
          : isLoadingInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LazyListStateImpl<T> implements _LazyListState<T> {
  const _$LazyListStateImpl(
      {required final List<T> items,
      required this.hasReachedMax,
      required this.hasNoData,
      required this.isLoadingInitial,
      required this.isLoadingMore,
      this.error})
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool hasReachedMax;
  @override
  final bool hasNoData;
  @override
  final bool isLoadingInitial;
  @override
  final bool isLoadingMore;
  @override
  final String? error;

  @override
  String toString() {
    return 'LazyListState<$T>(items: $items, hasReachedMax: $hasReachedMax, hasNoData: $hasNoData, isLoadingInitial: $isLoadingInitial, isLoadingMore: $isLoadingMore, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LazyListStateImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.hasNoData, hasNoData) ||
                other.hasNoData == hasNoData) &&
            (identical(other.isLoadingInitial, isLoadingInitial) ||
                other.isLoadingInitial == isLoadingInitial) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      hasReachedMax,
      hasNoData,
      isLoadingInitial,
      isLoadingMore,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LazyListStateImplCopyWith<T, _$LazyListStateImpl<T>> get copyWith =>
      __$$LazyListStateImplCopyWithImpl<T, _$LazyListStateImpl<T>>(
          this, _$identity);
}

abstract class _LazyListState<T> implements LazyListState<T> {
  const factory _LazyListState(
      {required final List<T> items,
      required final bool hasReachedMax,
      required final bool hasNoData,
      required final bool isLoadingInitial,
      required final bool isLoadingMore,
      final String? error}) = _$LazyListStateImpl<T>;

  @override
  List<T> get items;
  @override
  bool get hasReachedMax;
  @override
  bool get hasNoData;
  @override
  bool get isLoadingInitial;
  @override
  bool get isLoadingMore;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$LazyListStateImplCopyWith<T, _$LazyListStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
