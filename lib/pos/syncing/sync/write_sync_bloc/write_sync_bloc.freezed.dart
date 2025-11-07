// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_sync_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WriteSyncEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(dynamic manual) syncNow,
    required TResult Function() tick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(dynamic manual)? syncNow,
    TResult? Function()? tick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(dynamic manual)? syncNow,
    TResult Function()? tick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartPeriodicSync value) start,
    required TResult Function(_SyncNow value) syncNow,
    required TResult Function(_Tick value) tick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartPeriodicSync value)? start,
    TResult? Function(_SyncNow value)? syncNow,
    TResult? Function(_Tick value)? tick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartPeriodicSync value)? start,
    TResult Function(_SyncNow value)? syncNow,
    TResult Function(_Tick value)? tick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteSyncEventCopyWith<$Res> {
  factory $WriteSyncEventCopyWith(
          WriteSyncEvent value, $Res Function(WriteSyncEvent) then) =
      _$WriteSyncEventCopyWithImpl<$Res, WriteSyncEvent>;
}

/// @nodoc
class _$WriteSyncEventCopyWithImpl<$Res, $Val extends WriteSyncEvent>
    implements $WriteSyncEventCopyWith<$Res> {
  _$WriteSyncEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartPeriodicSyncImplCopyWith<$Res> {
  factory _$$StartPeriodicSyncImplCopyWith(_$StartPeriodicSyncImpl value,
          $Res Function(_$StartPeriodicSyncImpl) then) =
      __$$StartPeriodicSyncImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartPeriodicSyncImplCopyWithImpl<$Res>
    extends _$WriteSyncEventCopyWithImpl<$Res, _$StartPeriodicSyncImpl>
    implements _$$StartPeriodicSyncImplCopyWith<$Res> {
  __$$StartPeriodicSyncImplCopyWithImpl(_$StartPeriodicSyncImpl _value,
      $Res Function(_$StartPeriodicSyncImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartPeriodicSyncImpl implements _StartPeriodicSync {
  const _$StartPeriodicSyncImpl();

  @override
  String toString() {
    return 'WriteSyncEvent.start()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartPeriodicSyncImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(dynamic manual) syncNow,
    required TResult Function() tick,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(dynamic manual)? syncNow,
    TResult? Function()? tick,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(dynamic manual)? syncNow,
    TResult Function()? tick,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartPeriodicSync value) start,
    required TResult Function(_SyncNow value) syncNow,
    required TResult Function(_Tick value) tick,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartPeriodicSync value)? start,
    TResult? Function(_SyncNow value)? syncNow,
    TResult? Function(_Tick value)? tick,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartPeriodicSync value)? start,
    TResult Function(_SyncNow value)? syncNow,
    TResult Function(_Tick value)? tick,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _StartPeriodicSync implements WriteSyncEvent {
  const factory _StartPeriodicSync() = _$StartPeriodicSyncImpl;
}

/// @nodoc
abstract class _$$SyncNowImplCopyWith<$Res> {
  factory _$$SyncNowImplCopyWith(
          _$SyncNowImpl value, $Res Function(_$SyncNowImpl) then) =
      __$$SyncNowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic manual});
}

/// @nodoc
class __$$SyncNowImplCopyWithImpl<$Res>
    extends _$WriteSyncEventCopyWithImpl<$Res, _$SyncNowImpl>
    implements _$$SyncNowImplCopyWith<$Res> {
  __$$SyncNowImplCopyWithImpl(
      _$SyncNowImpl _value, $Res Function(_$SyncNowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manual = freezed,
  }) {
    return _then(_$SyncNowImpl(
      manual: freezed == manual ? _value.manual! : manual,
    ));
  }
}

/// @nodoc

class _$SyncNowImpl implements _SyncNow {
  const _$SyncNowImpl({this.manual = false});

  @override
  @JsonKey()
  final dynamic manual;

  @override
  String toString() {
    return 'WriteSyncEvent.syncNow(manual: $manual)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncNowImpl &&
            const DeepCollectionEquality().equals(other.manual, manual));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(manual));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncNowImplCopyWith<_$SyncNowImpl> get copyWith =>
      __$$SyncNowImplCopyWithImpl<_$SyncNowImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(dynamic manual) syncNow,
    required TResult Function() tick,
  }) {
    return syncNow(manual);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(dynamic manual)? syncNow,
    TResult? Function()? tick,
  }) {
    return syncNow?.call(manual);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(dynamic manual)? syncNow,
    TResult Function()? tick,
    required TResult orElse(),
  }) {
    if (syncNow != null) {
      return syncNow(manual);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartPeriodicSync value) start,
    required TResult Function(_SyncNow value) syncNow,
    required TResult Function(_Tick value) tick,
  }) {
    return syncNow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartPeriodicSync value)? start,
    TResult? Function(_SyncNow value)? syncNow,
    TResult? Function(_Tick value)? tick,
  }) {
    return syncNow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartPeriodicSync value)? start,
    TResult Function(_SyncNow value)? syncNow,
    TResult Function(_Tick value)? tick,
    required TResult orElse(),
  }) {
    if (syncNow != null) {
      return syncNow(this);
    }
    return orElse();
  }
}

abstract class _SyncNow implements WriteSyncEvent {
  const factory _SyncNow({final dynamic manual}) = _$SyncNowImpl;

  dynamic get manual;
  @JsonKey(ignore: true)
  _$$SyncNowImplCopyWith<_$SyncNowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TickImplCopyWith<$Res> {
  factory _$$TickImplCopyWith(
          _$TickImpl value, $Res Function(_$TickImpl) then) =
      __$$TickImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TickImplCopyWithImpl<$Res>
    extends _$WriteSyncEventCopyWithImpl<$Res, _$TickImpl>
    implements _$$TickImplCopyWith<$Res> {
  __$$TickImplCopyWithImpl(_$TickImpl _value, $Res Function(_$TickImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TickImpl implements _Tick {
  const _$TickImpl();

  @override
  String toString() {
    return 'WriteSyncEvent.tick()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TickImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(dynamic manual) syncNow,
    required TResult Function() tick,
  }) {
    return tick();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(dynamic manual)? syncNow,
    TResult? Function()? tick,
  }) {
    return tick?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(dynamic manual)? syncNow,
    TResult Function()? tick,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartPeriodicSync value) start,
    required TResult Function(_SyncNow value) syncNow,
    required TResult Function(_Tick value) tick,
  }) {
    return tick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartPeriodicSync value)? start,
    TResult? Function(_SyncNow value)? syncNow,
    TResult? Function(_Tick value)? tick,
  }) {
    return tick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartPeriodicSync value)? start,
    TResult Function(_SyncNow value)? syncNow,
    TResult Function(_Tick value)? tick,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick(this);
    }
    return orElse();
  }
}

abstract class _Tick implements WriteSyncEvent {
  const factory _Tick() = _$TickImpl;
}

/// @nodoc
mixin _$WriteSyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() syncing,
    required TResult Function(DateTime? lastSyncedAt, DateTime now) synced,
    required TResult Function(
            String message, DateTime? lastSyncedAt, DateTime now)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
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
abstract class $WriteSyncStateCopyWith<$Res> {
  factory $WriteSyncStateCopyWith(
          WriteSyncState value, $Res Function(WriteSyncState) then) =
      _$WriteSyncStateCopyWithImpl<$Res, WriteSyncState>;
}

/// @nodoc
class _$WriteSyncStateCopyWithImpl<$Res, $Val extends WriteSyncState>
    implements $WriteSyncStateCopyWith<$Res> {
  _$WriteSyncStateCopyWithImpl(this._value, this._then);

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
    extends _$WriteSyncStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'WriteSyncState.initial()';
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
    required TResult Function(DateTime? lastSyncedAt, DateTime now) synced,
    required TResult Function(
            String message, DateTime? lastSyncedAt, DateTime now)
        failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
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

abstract class _Initial implements WriteSyncState {
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
    extends _$WriteSyncStateCopyWithImpl<$Res, _$SyncingImpl>
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
    return 'WriteSyncState.syncing()';
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
    required TResult Function(DateTime? lastSyncedAt, DateTime now) synced,
    required TResult Function(
            String message, DateTime? lastSyncedAt, DateTime now)
        failure,
  }) {
    return syncing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
  }) {
    return syncing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
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

abstract class _Syncing implements WriteSyncState {
  const factory _Syncing() = _$SyncingImpl;
}

/// @nodoc
abstract class _$$SyncedImplCopyWith<$Res> {
  factory _$$SyncedImplCopyWith(
          _$SyncedImpl value, $Res Function(_$SyncedImpl) then) =
      __$$SyncedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? lastSyncedAt, DateTime now});
}

/// @nodoc
class __$$SyncedImplCopyWithImpl<$Res>
    extends _$WriteSyncStateCopyWithImpl<$Res, _$SyncedImpl>
    implements _$$SyncedImplCopyWith<$Res> {
  __$$SyncedImplCopyWithImpl(
      _$SyncedImpl _value, $Res Function(_$SyncedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastSyncedAt = freezed,
    Object? now = null,
  }) {
    return _then(_$SyncedImpl(
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      now: null == now
          ? _value.now
          : now // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SyncedImpl implements _Synced {
  const _$SyncedImpl({this.lastSyncedAt, required this.now});

  @override
  final DateTime? lastSyncedAt;
  @override
  final DateTime now;

  @override
  String toString() {
    return 'WriteSyncState.synced(lastSyncedAt: $lastSyncedAt, now: $now)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncedImpl &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt) &&
            (identical(other.now, now) || other.now == now));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastSyncedAt, now);

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
    required TResult Function(DateTime? lastSyncedAt, DateTime now) synced,
    required TResult Function(
            String message, DateTime? lastSyncedAt, DateTime now)
        failure,
  }) {
    return synced(lastSyncedAt, now);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
  }) {
    return synced?.call(lastSyncedAt, now);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(lastSyncedAt, now);
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

abstract class _Synced implements WriteSyncState {
  const factory _Synced(
      {final DateTime? lastSyncedAt,
      required final DateTime now}) = _$SyncedImpl;

  DateTime? get lastSyncedAt;
  DateTime get now;
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
  $Res call({String message, DateTime? lastSyncedAt, DateTime now});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$WriteSyncStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? lastSyncedAt = freezed,
    Object? now = null,
  }) {
    return _then(_$FailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      now: null == now
          ? _value.now
          : now // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(
      {required this.message, this.lastSyncedAt, required this.now});

  @override
  final String message;
  @override
  final DateTime? lastSyncedAt;
  @override
  final DateTime now;

  @override
  String toString() {
    return 'WriteSyncState.failure(message: $message, lastSyncedAt: $lastSyncedAt, now: $now)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt) &&
            (identical(other.now, now) || other.now == now));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, lastSyncedAt, now);

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
    required TResult Function(DateTime? lastSyncedAt, DateTime now) synced,
    required TResult Function(
            String message, DateTime? lastSyncedAt, DateTime now)
        failure,
  }) {
    return failure(message, lastSyncedAt, now);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? syncing,
    TResult? Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult? Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
  }) {
    return failure?.call(message, lastSyncedAt, now);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? syncing,
    TResult Function(DateTime? lastSyncedAt, DateTime now)? synced,
    TResult Function(String message, DateTime? lastSyncedAt, DateTime now)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message, lastSyncedAt, now);
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

abstract class _Failure implements WriteSyncState {
  const factory _Failure(
      {required final String message,
      final DateTime? lastSyncedAt,
      required final DateTime now}) = _$FailureImpl;

  String get message;
  DateTime? get lastSyncedAt;
  DateTime get now;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
