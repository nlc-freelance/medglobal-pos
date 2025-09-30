// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_catalog_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductCatalogEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialFetch,
    required TResult Function() deltaSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialFetch,
    TResult? Function()? deltaSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialFetch,
    TResult Function()? deltaSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialFetchProductCatalog value) initialFetch,
    required TResult Function(_DeltaSyncProductCatalog value) deltaSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialFetchProductCatalog value)? initialFetch,
    TResult? Function(_DeltaSyncProductCatalog value)? deltaSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialFetchProductCatalog value)? initialFetch,
    TResult Function(_DeltaSyncProductCatalog value)? deltaSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCatalogEventCopyWith<$Res> {
  factory $ProductCatalogEventCopyWith(
          ProductCatalogEvent value, $Res Function(ProductCatalogEvent) then) =
      _$ProductCatalogEventCopyWithImpl<$Res, ProductCatalogEvent>;
}

/// @nodoc
class _$ProductCatalogEventCopyWithImpl<$Res, $Val extends ProductCatalogEvent>
    implements $ProductCatalogEventCopyWith<$Res> {
  _$ProductCatalogEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialFetchProductCatalogImplCopyWith<$Res> {
  factory _$$InitialFetchProductCatalogImplCopyWith(
          _$InitialFetchProductCatalogImpl value,
          $Res Function(_$InitialFetchProductCatalogImpl) then) =
      __$$InitialFetchProductCatalogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialFetchProductCatalogImplCopyWithImpl<$Res>
    extends _$ProductCatalogEventCopyWithImpl<$Res,
        _$InitialFetchProductCatalogImpl>
    implements _$$InitialFetchProductCatalogImplCopyWith<$Res> {
  __$$InitialFetchProductCatalogImplCopyWithImpl(
      _$InitialFetchProductCatalogImpl _value,
      $Res Function(_$InitialFetchProductCatalogImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialFetchProductCatalogImpl implements _InitialFetchProductCatalog {
  const _$InitialFetchProductCatalogImpl();

  @override
  String toString() {
    return 'ProductCatalogEvent.initialFetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialFetchProductCatalogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialFetch,
    required TResult Function() deltaSync,
  }) {
    return initialFetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialFetch,
    TResult? Function()? deltaSync,
  }) {
    return initialFetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialFetch,
    TResult Function()? deltaSync,
    required TResult orElse(),
  }) {
    if (initialFetch != null) {
      return initialFetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialFetchProductCatalog value) initialFetch,
    required TResult Function(_DeltaSyncProductCatalog value) deltaSync,
  }) {
    return initialFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialFetchProductCatalog value)? initialFetch,
    TResult? Function(_DeltaSyncProductCatalog value)? deltaSync,
  }) {
    return initialFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialFetchProductCatalog value)? initialFetch,
    TResult Function(_DeltaSyncProductCatalog value)? deltaSync,
    required TResult orElse(),
  }) {
    if (initialFetch != null) {
      return initialFetch(this);
    }
    return orElse();
  }
}

abstract class _InitialFetchProductCatalog implements ProductCatalogEvent {
  const factory _InitialFetchProductCatalog() =
      _$InitialFetchProductCatalogImpl;
}

/// @nodoc
abstract class _$$DeltaSyncProductCatalogImplCopyWith<$Res> {
  factory _$$DeltaSyncProductCatalogImplCopyWith(
          _$DeltaSyncProductCatalogImpl value,
          $Res Function(_$DeltaSyncProductCatalogImpl) then) =
      __$$DeltaSyncProductCatalogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeltaSyncProductCatalogImplCopyWithImpl<$Res>
    extends _$ProductCatalogEventCopyWithImpl<$Res,
        _$DeltaSyncProductCatalogImpl>
    implements _$$DeltaSyncProductCatalogImplCopyWith<$Res> {
  __$$DeltaSyncProductCatalogImplCopyWithImpl(
      _$DeltaSyncProductCatalogImpl _value,
      $Res Function(_$DeltaSyncProductCatalogImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeltaSyncProductCatalogImpl implements _DeltaSyncProductCatalog {
  const _$DeltaSyncProductCatalogImpl();

  @override
  String toString() {
    return 'ProductCatalogEvent.deltaSync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeltaSyncProductCatalogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialFetch,
    required TResult Function() deltaSync,
  }) {
    return deltaSync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialFetch,
    TResult? Function()? deltaSync,
  }) {
    return deltaSync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialFetch,
    TResult Function()? deltaSync,
    required TResult orElse(),
  }) {
    if (deltaSync != null) {
      return deltaSync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialFetchProductCatalog value) initialFetch,
    required TResult Function(_DeltaSyncProductCatalog value) deltaSync,
  }) {
    return deltaSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialFetchProductCatalog value)? initialFetch,
    TResult? Function(_DeltaSyncProductCatalog value)? deltaSync,
  }) {
    return deltaSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialFetchProductCatalog value)? initialFetch,
    TResult Function(_DeltaSyncProductCatalog value)? deltaSync,
    required TResult orElse(),
  }) {
    if (deltaSync != null) {
      return deltaSync(this);
    }
    return orElse();
  }
}

abstract class _DeltaSyncProductCatalog implements ProductCatalogEvent {
  const factory _DeltaSyncProductCatalog() = _$DeltaSyncProductCatalogImpl;
}

/// @nodoc
mixin _$ProductCatalogRemoteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() syncing,
    required TResult Function(DateTime lastSyncedAt) synced,
    required TResult Function(String message, DateTime? lastSyncedAt) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime lastSyncedAt)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime lastSyncedAt)? synced,
    TResult Function(String message, DateTime? lastSyncedAt)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCatalogRemoteStateCopyWith<$Res> {
  factory $ProductCatalogRemoteStateCopyWith(ProductCatalogRemoteState value,
          $Res Function(ProductCatalogRemoteState) then) =
      _$ProductCatalogRemoteStateCopyWithImpl<$Res, ProductCatalogRemoteState>;
}

/// @nodoc
class _$ProductCatalogRemoteStateCopyWithImpl<$Res,
        $Val extends ProductCatalogRemoteState>
    implements $ProductCatalogRemoteStateCopyWith<$Res> {
  _$ProductCatalogRemoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductCatalogRemoteStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductCatalogRemoteState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() syncing,
    required TResult Function(DateTime lastSyncedAt) synced,
    required TResult Function(String message, DateTime? lastSyncedAt) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime lastSyncedAt)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime lastSyncedAt)? synced,
    TResult Function(String message, DateTime? lastSyncedAt)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductCatalogRemoteState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SyncingImplCopyWith<$Res> {
  factory _$$SyncingImplCopyWith(
          _$SyncingImpl value, $Res Function(_$SyncingImpl) then) =
      __$$SyncingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncingImplCopyWithImpl<$Res>
    extends _$ProductCatalogRemoteStateCopyWithImpl<$Res, _$SyncingImpl>
    implements _$$SyncingImplCopyWith<$Res> {
  __$$SyncingImplCopyWithImpl(
      _$SyncingImpl _value, $Res Function(_$SyncingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncingImpl implements _Syncing {
  const _$SyncingImpl();

  @override
  String toString() {
    return 'ProductCatalogRemoteState.syncing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() syncing,
    required TResult Function(DateTime lastSyncedAt) synced,
    required TResult Function(String message, DateTime? lastSyncedAt) failure,
  }) {
    return syncing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime lastSyncedAt)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt)? failure,
  }) {
    return syncing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime lastSyncedAt)? synced,
    TResult Function(String message, DateTime? lastSyncedAt)? failure,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_Failure value) failure,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_Failure value)? failure,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class _Syncing implements ProductCatalogRemoteState {
  const factory _Syncing() = _$SyncingImpl;
}

/// @nodoc
abstract class _$$SyncedImplCopyWith<$Res> {
  factory _$$SyncedImplCopyWith(
          _$SyncedImpl value, $Res Function(_$SyncedImpl) then) =
      __$$SyncedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime lastSyncedAt});
}

/// @nodoc
class __$$SyncedImplCopyWithImpl<$Res>
    extends _$ProductCatalogRemoteStateCopyWithImpl<$Res, _$SyncedImpl>
    implements _$$SyncedImplCopyWith<$Res> {
  __$$SyncedImplCopyWithImpl(
      _$SyncedImpl _value, $Res Function(_$SyncedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastSyncedAt = null,
  }) {
    return _then(_$SyncedImpl(
      null == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SyncedImpl implements _Synced {
  const _$SyncedImpl(this.lastSyncedAt);

  @override
  final DateTime lastSyncedAt;

  @override
  String toString() {
    return 'ProductCatalogRemoteState.synced(lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncedImpl &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastSyncedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncedImplCopyWith<_$SyncedImpl> get copyWith =>
      __$$SyncedImplCopyWithImpl<_$SyncedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() syncing,
    required TResult Function(DateTime lastSyncedAt) synced,
    required TResult Function(String message, DateTime? lastSyncedAt) failure,
  }) {
    return synced(lastSyncedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime lastSyncedAt)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt)? failure,
  }) {
    return synced?.call(lastSyncedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime lastSyncedAt)? synced,
    TResult Function(String message, DateTime? lastSyncedAt)? failure,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(lastSyncedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_Failure value) failure,
  }) {
    return synced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_Failure value)? failure,
  }) {
    return synced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(this);
    }
    return orElse();
  }
}

abstract class _Synced implements ProductCatalogRemoteState {
  const factory _Synced(final DateTime lastSyncedAt) = _$SyncedImpl;

  DateTime get lastSyncedAt;
  @JsonKey(ignore: true)
  _$$SyncedImplCopyWith<_$SyncedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, DateTime? lastSyncedAt});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ProductCatalogRemoteStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message, {this.lastSyncedAt});

  @override
  final String message;
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'ProductCatalogRemoteState.failure(message: $message, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, lastSyncedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() syncing,
    required TResult Function(DateTime lastSyncedAt) synced,
    required TResult Function(String message, DateTime? lastSyncedAt) failure,
  }) {
    return failure(message, lastSyncedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime lastSyncedAt)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt)? failure,
  }) {
    return failure?.call(message, lastSyncedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime lastSyncedAt)? synced,
    TResult Function(String message, DateTime? lastSyncedAt)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message, lastSyncedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Synced value) synced,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Synced value)? synced,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Synced value)? synced,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ProductCatalogRemoteState {
  const factory _Failure(final String message, {final DateTime? lastSyncedAt}) =
      _$FailureImpl;

  String get message;
  DateTime? get lastSyncedAt;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
