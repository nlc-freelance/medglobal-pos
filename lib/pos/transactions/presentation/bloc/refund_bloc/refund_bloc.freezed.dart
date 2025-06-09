// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RefundEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int registerId, int saleId,
            List<RefundItem> items, String? reasonForRefund)
        createRefund,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int registerId, int saleId, List<RefundItem> items,
            String? reasonForRefund)?
        createRefund,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int registerId, int saleId, List<RefundItem> items,
            String? reasonForRefund)?
        createRefund,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundEventCopyWith<$Res> {
  factory $RefundEventCopyWith(
          RefundEvent value, $Res Function(RefundEvent) then) =
      _$RefundEventCopyWithImpl<$Res, RefundEvent>;
}

/// @nodoc
class _$RefundEventCopyWithImpl<$Res, $Val extends RefundEvent>
    implements $RefundEventCopyWith<$Res> {
  _$RefundEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateRefundImplCopyWith<$Res> {
  factory _$$CreateRefundImplCopyWith(
          _$CreateRefundImpl value, $Res Function(_$CreateRefundImpl) then) =
      __$$CreateRefundImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int registerId,
      int saleId,
      List<RefundItem> items,
      String? reasonForRefund});
}

/// @nodoc
class __$$CreateRefundImplCopyWithImpl<$Res>
    extends _$RefundEventCopyWithImpl<$Res, _$CreateRefundImpl>
    implements _$$CreateRefundImplCopyWith<$Res> {
  __$$CreateRefundImplCopyWithImpl(
      _$CreateRefundImpl _value, $Res Function(_$CreateRefundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerId = null,
    Object? saleId = null,
    Object? items = null,
    Object? reasonForRefund = freezed,
  }) {
    return _then(_$CreateRefundImpl(
      registerId: null == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as int,
      saleId: null == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RefundItem>,
      reasonForRefund: freezed == reasonForRefund
          ? _value.reasonForRefund
          : reasonForRefund // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateRefundImpl implements _CreateRefund {
  const _$CreateRefundImpl(
      {required this.registerId,
      required this.saleId,
      required final List<RefundItem> items,
      this.reasonForRefund})
      : _items = items;

  @override
  final int registerId;
  @override
  final int saleId;
  final List<RefundItem> _items;
  @override
  List<RefundItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? reasonForRefund;

  @override
  String toString() {
    return 'RefundEvent.createRefund(registerId: $registerId, saleId: $saleId, items: $items, reasonForRefund: $reasonForRefund)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRefundImpl &&
            (identical(other.registerId, registerId) ||
                other.registerId == registerId) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.reasonForRefund, reasonForRefund) ||
                other.reasonForRefund == reasonForRefund));
  }

  @override
  int get hashCode => Object.hash(runtimeType, registerId, saleId,
      const DeepCollectionEquality().hash(_items), reasonForRefund);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRefundImplCopyWith<_$CreateRefundImpl> get copyWith =>
      __$$CreateRefundImplCopyWithImpl<_$CreateRefundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int registerId, int saleId,
            List<RefundItem> items, String? reasonForRefund)
        createRefund,
    required TResult Function() reset,
  }) {
    return createRefund(registerId, saleId, items, reasonForRefund);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int registerId, int saleId, List<RefundItem> items,
            String? reasonForRefund)?
        createRefund,
    TResult? Function()? reset,
  }) {
    return createRefund?.call(registerId, saleId, items, reasonForRefund);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int registerId, int saleId, List<RefundItem> items,
            String? reasonForRefund)?
        createRefund,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (createRefund != null) {
      return createRefund(registerId, saleId, items, reasonForRefund);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_Reset value) reset,
  }) {
    return createRefund(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_Reset value)? reset,
  }) {
    return createRefund?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (createRefund != null) {
      return createRefund(this);
    }
    return orElse();
  }
}

abstract class _CreateRefund implements RefundEvent {
  const factory _CreateRefund(
      {required final int registerId,
      required final int saleId,
      required final List<RefundItem> items,
      final String? reasonForRefund}) = _$CreateRefundImpl;

  int get registerId;
  int get saleId;
  List<RefundItem> get items;
  String? get reasonForRefund;
  @JsonKey(ignore: true)
  _$$CreateRefundImplCopyWith<_$CreateRefundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$RefundEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'RefundEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int registerId, int saleId,
            List<RefundItem> items, String? reasonForRefund)
        createRefund,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int registerId, int saleId, List<RefundItem> items,
            String? reasonForRefund)?
        createRefund,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int registerId, int saleId, List<RefundItem> items,
            String? reasonForRefund)?
        createRefund,
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
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements RefundEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$RefundState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(Transaction refund) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(Transaction refund)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(Transaction refund)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundStateCopyWith<$Res> {
  factory $RefundStateCopyWith(
          RefundState value, $Res Function(RefundState) then) =
      _$RefundStateCopyWithImpl<$Res, RefundState>;
}

/// @nodoc
class _$RefundStateCopyWithImpl<$Res, $Val extends RefundState>
    implements $RefundStateCopyWith<$Res> {
  _$RefundStateCopyWithImpl(this._value, this._then);

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
    extends _$RefundStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'RefundState.initial()';
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
    required TResult Function() processing,
    required TResult Function(Transaction refund) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(Transaction refund)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(Transaction refund)? success,
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
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RefundState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
          _$ProcessingImpl value, $Res Function(_$ProcessingImpl) then) =
      __$$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$RefundStateCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
      _$ProcessingImpl _value, $Res Function(_$ProcessingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProcessingImpl implements _Processing {
  const _$ProcessingImpl();

  @override
  String toString() {
    return 'RefundState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(Transaction refund) success,
    required TResult Function(String message) failure,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(Transaction refund)? success,
    TResult? Function(String message)? failure,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(Transaction refund)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements RefundState {
  const factory _Processing() = _$ProcessingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transaction refund});

  $TransactionCopyWith<$Res> get refund;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$RefundStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refund = null,
  }) {
    return _then(_$SuccessImpl(
      null == refund
          ? _value.refund
          : refund // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get refund {
    return $TransactionCopyWith<$Res>(_value.refund, (value) {
      return _then(_value.copyWith(refund: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.refund);

  @override
  final Transaction refund;

  @override
  String toString() {
    return 'RefundState.success(refund: $refund)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.refund, refund) || other.refund == refund));
  }

  @override
  int get hashCode => Object.hash(runtimeType, refund);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(Transaction refund) success,
    required TResult Function(String message) failure,
  }) {
    return success(refund);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(Transaction refund)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(refund);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(Transaction refund)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(refund);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements RefundState {
  const factory _Success(final Transaction refund) = _$SuccessImpl;

  Transaction get refund;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$RefundStateCopyWithImpl<$Res, _$FailureImpl>
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
    return 'RefundState.failure(message: $message)';
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
    required TResult Function() processing,
    required TResult Function(Transaction refund) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(Transaction refund)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(Transaction refund)? success,
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
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements RefundState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
