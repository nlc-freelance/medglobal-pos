// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_shift_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterShiftEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForOpen,
    required TResult Function() getLastClosed,
    required TResult Function(double amount) open,
    required TResult Function(int shiftId, double amount) close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForOpen,
    TResult? Function()? getLastClosed,
    TResult? Function(double amount)? open,
    TResult? Function(int shiftId, double amount)? close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForOpen,
    TResult Function()? getLastClosed,
    TResult Function(double amount)? open,
    TResult Function(int shiftId, double amount)? close,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckForOpenShift value) checkForOpen,
    required TResult Function(_GetLastClosedShift value) getLastClosed,
    required TResult Function(_OpenShift value) open,
    required TResult Function(_CloseShift value) close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckForOpenShift value)? checkForOpen,
    TResult? Function(_GetLastClosedShift value)? getLastClosed,
    TResult? Function(_OpenShift value)? open,
    TResult? Function(_CloseShift value)? close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckForOpenShift value)? checkForOpen,
    TResult Function(_GetLastClosedShift value)? getLastClosed,
    TResult Function(_OpenShift value)? open,
    TResult Function(_CloseShift value)? close,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterShiftEventCopyWith<$Res> {
  factory $RegisterShiftEventCopyWith(
          RegisterShiftEvent value, $Res Function(RegisterShiftEvent) then) =
      _$RegisterShiftEventCopyWithImpl<$Res, RegisterShiftEvent>;
}

/// @nodoc
class _$RegisterShiftEventCopyWithImpl<$Res, $Val extends RegisterShiftEvent>
    implements $RegisterShiftEventCopyWith<$Res> {
  _$RegisterShiftEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckForOpenShiftImplCopyWith<$Res> {
  factory _$$CheckForOpenShiftImplCopyWith(_$CheckForOpenShiftImpl value,
          $Res Function(_$CheckForOpenShiftImpl) then) =
      __$$CheckForOpenShiftImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckForOpenShiftImplCopyWithImpl<$Res>
    extends _$RegisterShiftEventCopyWithImpl<$Res, _$CheckForOpenShiftImpl>
    implements _$$CheckForOpenShiftImplCopyWith<$Res> {
  __$$CheckForOpenShiftImplCopyWithImpl(_$CheckForOpenShiftImpl _value,
      $Res Function(_$CheckForOpenShiftImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckForOpenShiftImpl implements _CheckForOpenShift {
  const _$CheckForOpenShiftImpl();

  @override
  String toString() {
    return 'RegisterShiftEvent.checkForOpen()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckForOpenShiftImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForOpen,
    required TResult Function() getLastClosed,
    required TResult Function(double amount) open,
    required TResult Function(int shiftId, double amount) close,
  }) {
    return checkForOpen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForOpen,
    TResult? Function()? getLastClosed,
    TResult? Function(double amount)? open,
    TResult? Function(int shiftId, double amount)? close,
  }) {
    return checkForOpen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForOpen,
    TResult Function()? getLastClosed,
    TResult Function(double amount)? open,
    TResult Function(int shiftId, double amount)? close,
    required TResult orElse(),
  }) {
    if (checkForOpen != null) {
      return checkForOpen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckForOpenShift value) checkForOpen,
    required TResult Function(_GetLastClosedShift value) getLastClosed,
    required TResult Function(_OpenShift value) open,
    required TResult Function(_CloseShift value) close,
  }) {
    return checkForOpen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckForOpenShift value)? checkForOpen,
    TResult? Function(_GetLastClosedShift value)? getLastClosed,
    TResult? Function(_OpenShift value)? open,
    TResult? Function(_CloseShift value)? close,
  }) {
    return checkForOpen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckForOpenShift value)? checkForOpen,
    TResult Function(_GetLastClosedShift value)? getLastClosed,
    TResult Function(_OpenShift value)? open,
    TResult Function(_CloseShift value)? close,
    required TResult orElse(),
  }) {
    if (checkForOpen != null) {
      return checkForOpen(this);
    }
    return orElse();
  }
}

abstract class _CheckForOpenShift implements RegisterShiftEvent {
  const factory _CheckForOpenShift() = _$CheckForOpenShiftImpl;
}

/// @nodoc
abstract class _$$GetLastClosedShiftImplCopyWith<$Res> {
  factory _$$GetLastClosedShiftImplCopyWith(_$GetLastClosedShiftImpl value,
          $Res Function(_$GetLastClosedShiftImpl) then) =
      __$$GetLastClosedShiftImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLastClosedShiftImplCopyWithImpl<$Res>
    extends _$RegisterShiftEventCopyWithImpl<$Res, _$GetLastClosedShiftImpl>
    implements _$$GetLastClosedShiftImplCopyWith<$Res> {
  __$$GetLastClosedShiftImplCopyWithImpl(_$GetLastClosedShiftImpl _value,
      $Res Function(_$GetLastClosedShiftImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLastClosedShiftImpl implements _GetLastClosedShift {
  const _$GetLastClosedShiftImpl();

  @override
  String toString() {
    return 'RegisterShiftEvent.getLastClosed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetLastClosedShiftImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForOpen,
    required TResult Function() getLastClosed,
    required TResult Function(double amount) open,
    required TResult Function(int shiftId, double amount) close,
  }) {
    return getLastClosed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForOpen,
    TResult? Function()? getLastClosed,
    TResult? Function(double amount)? open,
    TResult? Function(int shiftId, double amount)? close,
  }) {
    return getLastClosed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForOpen,
    TResult Function()? getLastClosed,
    TResult Function(double amount)? open,
    TResult Function(int shiftId, double amount)? close,
    required TResult orElse(),
  }) {
    if (getLastClosed != null) {
      return getLastClosed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckForOpenShift value) checkForOpen,
    required TResult Function(_GetLastClosedShift value) getLastClosed,
    required TResult Function(_OpenShift value) open,
    required TResult Function(_CloseShift value) close,
  }) {
    return getLastClosed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckForOpenShift value)? checkForOpen,
    TResult? Function(_GetLastClosedShift value)? getLastClosed,
    TResult? Function(_OpenShift value)? open,
    TResult? Function(_CloseShift value)? close,
  }) {
    return getLastClosed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckForOpenShift value)? checkForOpen,
    TResult Function(_GetLastClosedShift value)? getLastClosed,
    TResult Function(_OpenShift value)? open,
    TResult Function(_CloseShift value)? close,
    required TResult orElse(),
  }) {
    if (getLastClosed != null) {
      return getLastClosed(this);
    }
    return orElse();
  }
}

abstract class _GetLastClosedShift implements RegisterShiftEvent {
  const factory _GetLastClosedShift() = _$GetLastClosedShiftImpl;
}

/// @nodoc
abstract class _$$OpenShiftImplCopyWith<$Res> {
  factory _$$OpenShiftImplCopyWith(
          _$OpenShiftImpl value, $Res Function(_$OpenShiftImpl) then) =
      __$$OpenShiftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double amount});
}

/// @nodoc
class __$$OpenShiftImplCopyWithImpl<$Res>
    extends _$RegisterShiftEventCopyWithImpl<$Res, _$OpenShiftImpl>
    implements _$$OpenShiftImplCopyWith<$Res> {
  __$$OpenShiftImplCopyWithImpl(
      _$OpenShiftImpl _value, $Res Function(_$OpenShiftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$OpenShiftImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OpenShiftImpl implements _OpenShift {
  const _$OpenShiftImpl(this.amount);

  @override
  final double amount;

  @override
  String toString() {
    return 'RegisterShiftEvent.open(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenShiftImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenShiftImplCopyWith<_$OpenShiftImpl> get copyWith =>
      __$$OpenShiftImplCopyWithImpl<_$OpenShiftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForOpen,
    required TResult Function() getLastClosed,
    required TResult Function(double amount) open,
    required TResult Function(int shiftId, double amount) close,
  }) {
    return open(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForOpen,
    TResult? Function()? getLastClosed,
    TResult? Function(double amount)? open,
    TResult? Function(int shiftId, double amount)? close,
  }) {
    return open?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForOpen,
    TResult Function()? getLastClosed,
    TResult Function(double amount)? open,
    TResult Function(int shiftId, double amount)? close,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckForOpenShift value) checkForOpen,
    required TResult Function(_GetLastClosedShift value) getLastClosed,
    required TResult Function(_OpenShift value) open,
    required TResult Function(_CloseShift value) close,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckForOpenShift value)? checkForOpen,
    TResult? Function(_GetLastClosedShift value)? getLastClosed,
    TResult? Function(_OpenShift value)? open,
    TResult? Function(_CloseShift value)? close,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckForOpenShift value)? checkForOpen,
    TResult Function(_GetLastClosedShift value)? getLastClosed,
    TResult Function(_OpenShift value)? open,
    TResult Function(_CloseShift value)? close,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class _OpenShift implements RegisterShiftEvent {
  const factory _OpenShift(final double amount) = _$OpenShiftImpl;

  double get amount;
  @JsonKey(ignore: true)
  _$$OpenShiftImplCopyWith<_$OpenShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseShiftImplCopyWith<$Res> {
  factory _$$CloseShiftImplCopyWith(
          _$CloseShiftImpl value, $Res Function(_$CloseShiftImpl) then) =
      __$$CloseShiftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int shiftId, double amount});
}

/// @nodoc
class __$$CloseShiftImplCopyWithImpl<$Res>
    extends _$RegisterShiftEventCopyWithImpl<$Res, _$CloseShiftImpl>
    implements _$$CloseShiftImplCopyWith<$Res> {
  __$$CloseShiftImplCopyWithImpl(
      _$CloseShiftImpl _value, $Res Function(_$CloseShiftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftId = null,
    Object? amount = null,
  }) {
    return _then(_$CloseShiftImpl(
      null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CloseShiftImpl implements _CloseShift {
  const _$CloseShiftImpl(this.shiftId, this.amount);

  @override
  final int shiftId;
  @override
  final double amount;

  @override
  String toString() {
    return 'RegisterShiftEvent.close(shiftId: $shiftId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseShiftImpl &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shiftId, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseShiftImplCopyWith<_$CloseShiftImpl> get copyWith =>
      __$$CloseShiftImplCopyWithImpl<_$CloseShiftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForOpen,
    required TResult Function() getLastClosed,
    required TResult Function(double amount) open,
    required TResult Function(int shiftId, double amount) close,
  }) {
    return close(shiftId, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForOpen,
    TResult? Function()? getLastClosed,
    TResult? Function(double amount)? open,
    TResult? Function(int shiftId, double amount)? close,
  }) {
    return close?.call(shiftId, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForOpen,
    TResult Function()? getLastClosed,
    TResult Function(double amount)? open,
    TResult Function(int shiftId, double amount)? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(shiftId, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckForOpenShift value) checkForOpen,
    required TResult Function(_GetLastClosedShift value) getLastClosed,
    required TResult Function(_OpenShift value) open,
    required TResult Function(_CloseShift value) close,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckForOpenShift value)? checkForOpen,
    TResult? Function(_GetLastClosedShift value)? getLastClosed,
    TResult? Function(_OpenShift value)? open,
    TResult? Function(_CloseShift value)? close,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckForOpenShift value)? checkForOpen,
    TResult Function(_GetLastClosedShift value)? getLastClosed,
    TResult Function(_OpenShift value)? open,
    TResult Function(_CloseShift value)? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _CloseShift implements RegisterShiftEvent {
  const factory _CloseShift(final int shiftId, final double amount) =
      _$CloseShiftImpl;

  int get shiftId;
  double get amount;
  @JsonKey(ignore: true)
  _$$CloseShiftImplCopyWith<_$CloseShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterShiftState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterShift shift, String? message) open,
    required TResult Function(DateTime? closedSince) closed,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterShift shift, String? message)? open,
    TResult? Function(DateTime? closedSince)? closed,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterShift shift, String? message)? open,
    TResult Function(DateTime? closedSince)? closed,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterShiftStateCopyWith<$Res> {
  factory $RegisterShiftStateCopyWith(
          RegisterShiftState value, $Res Function(RegisterShiftState) then) =
      _$RegisterShiftStateCopyWithImpl<$Res, RegisterShiftState>;
}

/// @nodoc
class _$RegisterShiftStateCopyWithImpl<$Res, $Val extends RegisterShiftState>
    implements $RegisterShiftStateCopyWith<$Res> {
  _$RegisterShiftStateCopyWithImpl(this._value, this._then);

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
    extends _$RegisterShiftStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'RegisterShiftState.initial()';
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
    required TResult Function() loading,
    required TResult Function(RegisterShift shift, String? message) open,
    required TResult Function(DateTime? closedSince) closed,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterShift shift, String? message)? open,
    TResult? Function(DateTime? closedSince)? closed,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterShift shift, String? message)? open,
    TResult Function(DateTime? closedSince)? closed,
    TResult Function(String message)? failure,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterShiftState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$RegisterShiftStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'RegisterShiftState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterShift shift, String? message) open,
    required TResult Function(DateTime? closedSince) closed,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterShift shift, String? message)? open,
    TResult? Function(DateTime? closedSince)? closed,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterShift shift, String? message)? open,
    TResult Function(DateTime? closedSince)? closed,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RegisterShiftState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$OpenImplCopyWith<$Res> {
  factory _$$OpenImplCopyWith(
          _$OpenImpl value, $Res Function(_$OpenImpl) then) =
      __$$OpenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterShift shift, String? message});

  $RegisterShiftCopyWith<$Res> get shift;
}

/// @nodoc
class __$$OpenImplCopyWithImpl<$Res>
    extends _$RegisterShiftStateCopyWithImpl<$Res, _$OpenImpl>
    implements _$$OpenImplCopyWith<$Res> {
  __$$OpenImplCopyWithImpl(_$OpenImpl _value, $Res Function(_$OpenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shift = null,
    Object? message = freezed,
  }) {
    return _then(_$OpenImpl(
      null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as RegisterShift,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterShiftCopyWith<$Res> get shift {
    return $RegisterShiftCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value));
    });
  }
}

/// @nodoc

class _$OpenImpl implements _Open {
  const _$OpenImpl(this.shift, {this.message});

  @override
  final RegisterShift shift;
  @override
  final String? message;

  @override
  String toString() {
    return 'RegisterShiftState.open(shift: $shift, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenImpl &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shift, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenImplCopyWith<_$OpenImpl> get copyWith =>
      __$$OpenImplCopyWithImpl<_$OpenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterShift shift, String? message) open,
    required TResult Function(DateTime? closedSince) closed,
    required TResult Function(String message) failure,
  }) {
    return open(shift, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterShift shift, String? message)? open,
    TResult? Function(DateTime? closedSince)? closed,
    TResult? Function(String message)? failure,
  }) {
    return open?.call(shift, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterShift shift, String? message)? open,
    TResult Function(DateTime? closedSince)? closed,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(shift, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Failure value) failure,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Failure value)? failure,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class _Open implements RegisterShiftState {
  const factory _Open(final RegisterShift shift, {final String? message}) =
      _$OpenImpl;

  RegisterShift get shift;
  String? get message;
  @JsonKey(ignore: true)
  _$$OpenImplCopyWith<_$OpenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosedImplCopyWith<$Res> {
  factory _$$ClosedImplCopyWith(
          _$ClosedImpl value, $Res Function(_$ClosedImpl) then) =
      __$$ClosedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? closedSince});
}

/// @nodoc
class __$$ClosedImplCopyWithImpl<$Res>
    extends _$RegisterShiftStateCopyWithImpl<$Res, _$ClosedImpl>
    implements _$$ClosedImplCopyWith<$Res> {
  __$$ClosedImplCopyWithImpl(
      _$ClosedImpl _value, $Res Function(_$ClosedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closedSince = freezed,
  }) {
    return _then(_$ClosedImpl(
      freezed == closedSince
          ? _value.closedSince
          : closedSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ClosedImpl implements _Closed {
  const _$ClosedImpl(this.closedSince);

  @override
  final DateTime? closedSince;

  @override
  String toString() {
    return 'RegisterShiftState.closed(closedSince: $closedSince)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedImpl &&
            (identical(other.closedSince, closedSince) ||
                other.closedSince == closedSince));
  }

  @override
  int get hashCode => Object.hash(runtimeType, closedSince);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedImplCopyWith<_$ClosedImpl> get copyWith =>
      __$$ClosedImplCopyWithImpl<_$ClosedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterShift shift, String? message) open,
    required TResult Function(DateTime? closedSince) closed,
    required TResult Function(String message) failure,
  }) {
    return closed(closedSince);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterShift shift, String? message)? open,
    TResult? Function(DateTime? closedSince)? closed,
    TResult? Function(String message)? failure,
  }) {
    return closed?.call(closedSince);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterShift shift, String? message)? open,
    TResult Function(DateTime? closedSince)? closed,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed(closedSince);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Failure value) failure,
  }) {
    return closed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Failure value)? failure,
  }) {
    return closed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed(this);
    }
    return orElse();
  }
}

abstract class _Closed implements RegisterShiftState {
  const factory _Closed(final DateTime? closedSince) = _$ClosedImpl;

  DateTime? get closedSince;
  @JsonKey(ignore: true)
  _$$ClosedImplCopyWith<_$ClosedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$RegisterShiftStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterShiftState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterShift shift, String? message) open,
    required TResult Function(DateTime? closedSince) closed,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterShift shift, String? message)? open,
    TResult? Function(DateTime? closedSince)? closed,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterShift shift, String? message)? open,
    TResult Function(DateTime? closedSince)? closed,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements RegisterShiftState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
