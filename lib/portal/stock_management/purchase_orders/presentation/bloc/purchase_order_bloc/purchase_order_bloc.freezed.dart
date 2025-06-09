// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getPurchaseOrderById,
    required TResult Function(NewPurchaseOrder po) createPurchaseOrder,
    required TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)
        updatePurchaseOrder,
    required TResult Function(int id) cancelPurchaseOrder,
    required TResult Function(int id) deletePurchaseOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getPurchaseOrderById,
    TResult? Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult? Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult? Function(int id)? cancelPurchaseOrder,
    TResult? Function(int id)? deletePurchaseOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getPurchaseOrderById,
    TResult Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult Function(int id)? cancelPurchaseOrder,
    TResult Function(int id)? deletePurchaseOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPurchaseOrderById value) getPurchaseOrderById,
    required TResult Function(_CreatePurchaseOrder value) createPurchaseOrder,
    required TResult Function(_UpdatePurchaseOrder value) updatePurchaseOrder,
    required TResult Function(_CancelPurchaseOrder value) cancelPurchaseOrder,
    required TResult Function(_DeletePurchaseOrder value) deletePurchaseOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult? Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult? Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult? Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult? Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderEventCopyWith<$Res> {
  factory $PurchaseOrderEventCopyWith(
          PurchaseOrderEvent value, $Res Function(PurchaseOrderEvent) then) =
      _$PurchaseOrderEventCopyWithImpl<$Res, PurchaseOrderEvent>;
}

/// @nodoc
class _$PurchaseOrderEventCopyWithImpl<$Res, $Val extends PurchaseOrderEvent>
    implements $PurchaseOrderEventCopyWith<$Res> {
  _$PurchaseOrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetPurchaseOrderByIdImplCopyWith<$Res> {
  factory _$$GetPurchaseOrderByIdImplCopyWith(_$GetPurchaseOrderByIdImpl value,
          $Res Function(_$GetPurchaseOrderByIdImpl) then) =
      __$$GetPurchaseOrderByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetPurchaseOrderByIdImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$GetPurchaseOrderByIdImpl>
    implements _$$GetPurchaseOrderByIdImplCopyWith<$Res> {
  __$$GetPurchaseOrderByIdImplCopyWithImpl(_$GetPurchaseOrderByIdImpl _value,
      $Res Function(_$GetPurchaseOrderByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetPurchaseOrderByIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetPurchaseOrderByIdImpl implements _GetPurchaseOrderById {
  const _$GetPurchaseOrderByIdImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'PurchaseOrderEvent.getPurchaseOrderById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPurchaseOrderByIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPurchaseOrderByIdImplCopyWith<_$GetPurchaseOrderByIdImpl>
      get copyWith =>
          __$$GetPurchaseOrderByIdImplCopyWithImpl<_$GetPurchaseOrderByIdImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getPurchaseOrderById,
    required TResult Function(NewPurchaseOrder po) createPurchaseOrder,
    required TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)
        updatePurchaseOrder,
    required TResult Function(int id) cancelPurchaseOrder,
    required TResult Function(int id) deletePurchaseOrder,
  }) {
    return getPurchaseOrderById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getPurchaseOrderById,
    TResult? Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult? Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult? Function(int id)? cancelPurchaseOrder,
    TResult? Function(int id)? deletePurchaseOrder,
  }) {
    return getPurchaseOrderById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getPurchaseOrderById,
    TResult Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult Function(int id)? cancelPurchaseOrder,
    TResult Function(int id)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (getPurchaseOrderById != null) {
      return getPurchaseOrderById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPurchaseOrderById value) getPurchaseOrderById,
    required TResult Function(_CreatePurchaseOrder value) createPurchaseOrder,
    required TResult Function(_UpdatePurchaseOrder value) updatePurchaseOrder,
    required TResult Function(_CancelPurchaseOrder value) cancelPurchaseOrder,
    required TResult Function(_DeletePurchaseOrder value) deletePurchaseOrder,
  }) {
    return getPurchaseOrderById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult? Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult? Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult? Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult? Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
  }) {
    return getPurchaseOrderById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (getPurchaseOrderById != null) {
      return getPurchaseOrderById(this);
    }
    return orElse();
  }
}

abstract class _GetPurchaseOrderById implements PurchaseOrderEvent {
  const factory _GetPurchaseOrderById(final int id) =
      _$GetPurchaseOrderByIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetPurchaseOrderByIdImplCopyWith<_$GetPurchaseOrderByIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatePurchaseOrderImplCopyWith<$Res> {
  factory _$$CreatePurchaseOrderImplCopyWith(_$CreatePurchaseOrderImpl value,
          $Res Function(_$CreatePurchaseOrderImpl) then) =
      __$$CreatePurchaseOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NewPurchaseOrder po});

  $NewPurchaseOrderCopyWith<$Res> get po;
}

/// @nodoc
class __$$CreatePurchaseOrderImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$CreatePurchaseOrderImpl>
    implements _$$CreatePurchaseOrderImplCopyWith<$Res> {
  __$$CreatePurchaseOrderImplCopyWithImpl(_$CreatePurchaseOrderImpl _value,
      $Res Function(_$CreatePurchaseOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? po = null,
  }) {
    return _then(_$CreatePurchaseOrderImpl(
      null == po
          ? _value.po
          : po // ignore: cast_nullable_to_non_nullable
              as NewPurchaseOrder,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NewPurchaseOrderCopyWith<$Res> get po {
    return $NewPurchaseOrderCopyWith<$Res>(_value.po, (value) {
      return _then(_value.copyWith(po: value));
    });
  }
}

/// @nodoc

class _$CreatePurchaseOrderImpl implements _CreatePurchaseOrder {
  const _$CreatePurchaseOrderImpl(this.po);

  @override
  final NewPurchaseOrder po;

  @override
  String toString() {
    return 'PurchaseOrderEvent.createPurchaseOrder(po: $po)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePurchaseOrderImpl &&
            (identical(other.po, po) || other.po == po));
  }

  @override
  int get hashCode => Object.hash(runtimeType, po);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePurchaseOrderImplCopyWith<_$CreatePurchaseOrderImpl> get copyWith =>
      __$$CreatePurchaseOrderImplCopyWithImpl<_$CreatePurchaseOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getPurchaseOrderById,
    required TResult Function(NewPurchaseOrder po) createPurchaseOrder,
    required TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)
        updatePurchaseOrder,
    required TResult Function(int id) cancelPurchaseOrder,
    required TResult Function(int id) deletePurchaseOrder,
  }) {
    return createPurchaseOrder(po);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getPurchaseOrderById,
    TResult? Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult? Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult? Function(int id)? cancelPurchaseOrder,
    TResult? Function(int id)? deletePurchaseOrder,
  }) {
    return createPurchaseOrder?.call(po);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getPurchaseOrderById,
    TResult Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult Function(int id)? cancelPurchaseOrder,
    TResult Function(int id)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (createPurchaseOrder != null) {
      return createPurchaseOrder(po);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPurchaseOrderById value) getPurchaseOrderById,
    required TResult Function(_CreatePurchaseOrder value) createPurchaseOrder,
    required TResult Function(_UpdatePurchaseOrder value) updatePurchaseOrder,
    required TResult Function(_CancelPurchaseOrder value) cancelPurchaseOrder,
    required TResult Function(_DeletePurchaseOrder value) deletePurchaseOrder,
  }) {
    return createPurchaseOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult? Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult? Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult? Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult? Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
  }) {
    return createPurchaseOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (createPurchaseOrder != null) {
      return createPurchaseOrder(this);
    }
    return orElse();
  }
}

abstract class _CreatePurchaseOrder implements PurchaseOrderEvent {
  const factory _CreatePurchaseOrder(final NewPurchaseOrder po) =
      _$CreatePurchaseOrderImpl;

  NewPurchaseOrder get po;
  @JsonKey(ignore: true)
  _$$CreatePurchaseOrderImplCopyWith<_$CreatePurchaseOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePurchaseOrderImplCopyWith<$Res> {
  factory _$$UpdatePurchaseOrderImplCopyWith(_$UpdatePurchaseOrderImpl value,
          $Res Function(_$UpdatePurchaseOrderImpl) then) =
      __$$UpdatePurchaseOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$UpdatePurchaseOrderImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$UpdatePurchaseOrderImpl>
    implements _$$UpdatePurchaseOrderImplCopyWith<$Res> {
  __$$UpdatePurchaseOrderImplCopyWithImpl(_$UpdatePurchaseOrderImpl _value,
      $Res Function(_$UpdatePurchaseOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? id = null,
    Object? purchaseOrder = null,
  }) {
    return _then(_$UpdatePurchaseOrderImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as UpdatePurchaseOrder,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value));
    });
  }
}

/// @nodoc

class _$UpdatePurchaseOrderImpl implements _UpdatePurchaseOrder {
  const _$UpdatePurchaseOrderImpl(
      {required this.action, required this.id, required this.purchaseOrder});

  @override
  final UpdatePurchaseOrder action;
  @override
  final int id;
  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderEvent.updatePurchaseOrder(action: $action, id: $id, purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePurchaseOrderImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action, id, purchaseOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePurchaseOrderImplCopyWith<_$UpdatePurchaseOrderImpl> get copyWith =>
      __$$UpdatePurchaseOrderImplCopyWithImpl<_$UpdatePurchaseOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getPurchaseOrderById,
    required TResult Function(NewPurchaseOrder po) createPurchaseOrder,
    required TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)
        updatePurchaseOrder,
    required TResult Function(int id) cancelPurchaseOrder,
    required TResult Function(int id) deletePurchaseOrder,
  }) {
    return updatePurchaseOrder(action, id, purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getPurchaseOrderById,
    TResult? Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult? Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult? Function(int id)? cancelPurchaseOrder,
    TResult? Function(int id)? deletePurchaseOrder,
  }) {
    return updatePurchaseOrder?.call(action, id, purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getPurchaseOrderById,
    TResult Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult Function(int id)? cancelPurchaseOrder,
    TResult Function(int id)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (updatePurchaseOrder != null) {
      return updatePurchaseOrder(action, id, purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPurchaseOrderById value) getPurchaseOrderById,
    required TResult Function(_CreatePurchaseOrder value) createPurchaseOrder,
    required TResult Function(_UpdatePurchaseOrder value) updatePurchaseOrder,
    required TResult Function(_CancelPurchaseOrder value) cancelPurchaseOrder,
    required TResult Function(_DeletePurchaseOrder value) deletePurchaseOrder,
  }) {
    return updatePurchaseOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult? Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult? Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult? Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult? Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
  }) {
    return updatePurchaseOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (updatePurchaseOrder != null) {
      return updatePurchaseOrder(this);
    }
    return orElse();
  }
}

abstract class _UpdatePurchaseOrder implements PurchaseOrderEvent {
  const factory _UpdatePurchaseOrder(
      {required final UpdatePurchaseOrder action,
      required final int id,
      required final PurchaseOrder purchaseOrder}) = _$UpdatePurchaseOrderImpl;

  UpdatePurchaseOrder get action;
  int get id;
  PurchaseOrder get purchaseOrder;
  @JsonKey(ignore: true)
  _$$UpdatePurchaseOrderImplCopyWith<_$UpdatePurchaseOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelPurchaseOrderImplCopyWith<$Res> {
  factory _$$CancelPurchaseOrderImplCopyWith(_$CancelPurchaseOrderImpl value,
          $Res Function(_$CancelPurchaseOrderImpl) then) =
      __$$CancelPurchaseOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$CancelPurchaseOrderImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$CancelPurchaseOrderImpl>
    implements _$$CancelPurchaseOrderImplCopyWith<$Res> {
  __$$CancelPurchaseOrderImplCopyWithImpl(_$CancelPurchaseOrderImpl _value,
      $Res Function(_$CancelPurchaseOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CancelPurchaseOrderImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CancelPurchaseOrderImpl implements _CancelPurchaseOrder {
  const _$CancelPurchaseOrderImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'PurchaseOrderEvent.cancelPurchaseOrder(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelPurchaseOrderImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelPurchaseOrderImplCopyWith<_$CancelPurchaseOrderImpl> get copyWith =>
      __$$CancelPurchaseOrderImplCopyWithImpl<_$CancelPurchaseOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getPurchaseOrderById,
    required TResult Function(NewPurchaseOrder po) createPurchaseOrder,
    required TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)
        updatePurchaseOrder,
    required TResult Function(int id) cancelPurchaseOrder,
    required TResult Function(int id) deletePurchaseOrder,
  }) {
    return cancelPurchaseOrder(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getPurchaseOrderById,
    TResult? Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult? Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult? Function(int id)? cancelPurchaseOrder,
    TResult? Function(int id)? deletePurchaseOrder,
  }) {
    return cancelPurchaseOrder?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getPurchaseOrderById,
    TResult Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult Function(int id)? cancelPurchaseOrder,
    TResult Function(int id)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (cancelPurchaseOrder != null) {
      return cancelPurchaseOrder(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPurchaseOrderById value) getPurchaseOrderById,
    required TResult Function(_CreatePurchaseOrder value) createPurchaseOrder,
    required TResult Function(_UpdatePurchaseOrder value) updatePurchaseOrder,
    required TResult Function(_CancelPurchaseOrder value) cancelPurchaseOrder,
    required TResult Function(_DeletePurchaseOrder value) deletePurchaseOrder,
  }) {
    return cancelPurchaseOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult? Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult? Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult? Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult? Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
  }) {
    return cancelPurchaseOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (cancelPurchaseOrder != null) {
      return cancelPurchaseOrder(this);
    }
    return orElse();
  }
}

abstract class _CancelPurchaseOrder implements PurchaseOrderEvent {
  const factory _CancelPurchaseOrder(final int id) = _$CancelPurchaseOrderImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$CancelPurchaseOrderImplCopyWith<_$CancelPurchaseOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePurchaseOrderImplCopyWith<$Res> {
  factory _$$DeletePurchaseOrderImplCopyWith(_$DeletePurchaseOrderImpl value,
          $Res Function(_$DeletePurchaseOrderImpl) then) =
      __$$DeletePurchaseOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeletePurchaseOrderImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$DeletePurchaseOrderImpl>
    implements _$$DeletePurchaseOrderImplCopyWith<$Res> {
  __$$DeletePurchaseOrderImplCopyWithImpl(_$DeletePurchaseOrderImpl _value,
      $Res Function(_$DeletePurchaseOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeletePurchaseOrderImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeletePurchaseOrderImpl implements _DeletePurchaseOrder {
  const _$DeletePurchaseOrderImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'PurchaseOrderEvent.deletePurchaseOrder(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePurchaseOrderImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePurchaseOrderImplCopyWith<_$DeletePurchaseOrderImpl> get copyWith =>
      __$$DeletePurchaseOrderImplCopyWithImpl<_$DeletePurchaseOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getPurchaseOrderById,
    required TResult Function(NewPurchaseOrder po) createPurchaseOrder,
    required TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)
        updatePurchaseOrder,
    required TResult Function(int id) cancelPurchaseOrder,
    required TResult Function(int id) deletePurchaseOrder,
  }) {
    return deletePurchaseOrder(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getPurchaseOrderById,
    TResult? Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult? Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult? Function(int id)? cancelPurchaseOrder,
    TResult? Function(int id)? deletePurchaseOrder,
  }) {
    return deletePurchaseOrder?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getPurchaseOrderById,
    TResult Function(NewPurchaseOrder po)? createPurchaseOrder,
    TResult Function(
            UpdatePurchaseOrder action, int id, PurchaseOrder purchaseOrder)?
        updatePurchaseOrder,
    TResult Function(int id)? cancelPurchaseOrder,
    TResult Function(int id)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (deletePurchaseOrder != null) {
      return deletePurchaseOrder(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPurchaseOrderById value) getPurchaseOrderById,
    required TResult Function(_CreatePurchaseOrder value) createPurchaseOrder,
    required TResult Function(_UpdatePurchaseOrder value) updatePurchaseOrder,
    required TResult Function(_CancelPurchaseOrder value) cancelPurchaseOrder,
    required TResult Function(_DeletePurchaseOrder value) deletePurchaseOrder,
  }) {
    return deletePurchaseOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult? Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult? Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult? Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult? Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
  }) {
    return deletePurchaseOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPurchaseOrderById value)? getPurchaseOrderById,
    TResult Function(_CreatePurchaseOrder value)? createPurchaseOrder,
    TResult Function(_UpdatePurchaseOrder value)? updatePurchaseOrder,
    TResult Function(_CancelPurchaseOrder value)? cancelPurchaseOrder,
    TResult Function(_DeletePurchaseOrder value)? deletePurchaseOrder,
    required TResult orElse(),
  }) {
    if (deletePurchaseOrder != null) {
      return deletePurchaseOrder(this);
    }
    return orElse();
  }
}

abstract class _DeletePurchaseOrder implements PurchaseOrderEvent {
  const factory _DeletePurchaseOrder(final int id) = _$DeletePurchaseOrderImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeletePurchaseOrderImplCopyWith<_$DeletePurchaseOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderStateCopyWith<$Res> {
  factory $PurchaseOrderStateCopyWith(
          PurchaseOrderState value, $Res Function(PurchaseOrderState) then) =
      _$PurchaseOrderStateCopyWithImpl<$Res, PurchaseOrderState>;
}

/// @nodoc
class _$PurchaseOrderStateCopyWithImpl<$Res, $Val extends PurchaseOrderState>
    implements $PurchaseOrderStateCopyWith<$Res> {
  _$PurchaseOrderStateCopyWithImpl(this._value, this._then);

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
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'PurchaseOrderState.initial()';
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
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PurchaseOrderState {
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
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'PurchaseOrderState.loading()';
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
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PurchaseOrderState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder po});

  $PurchaseOrderCopyWith<$Res> get po;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? po = null,
  }) {
    return _then(_$LoadedImpl(
      null == po
          ? _value.po
          : po // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get po {
    return $PurchaseOrderCopyWith<$Res>(_value.po, (value) {
      return _then(_value.copyWith(po: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.po);

  @override
  final PurchaseOrder po;

  @override
  String toString() {
    return 'PurchaseOrderState.loaded(po: $po)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.po, po) || other.po == po));
  }

  @override
  int get hashCode => Object.hash(runtimeType, po);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return loaded(po);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(po);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(po);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PurchaseOrderState {
  const factory _Loaded(final PurchaseOrder po) = _$LoadedImpl;

  PurchaseOrder get po;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailedImplCopyWith<$Res> {
  factory _$$LoadFailedImplCopyWith(
          _$LoadFailedImpl value, $Res Function(_$LoadFailedImpl) then) =
      __$$LoadFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoadFailedImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$LoadFailedImpl>
    implements _$$LoadFailedImplCopyWith<$Res> {
  __$$LoadFailedImplCopyWithImpl(
      _$LoadFailedImpl _value, $Res Function(_$LoadFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoadFailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadFailedImpl implements _LoadFailed {
  const _$LoadFailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PurchaseOrderState.loadFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailedImplCopyWith<_$LoadFailedImpl> get copyWith =>
      __$$LoadFailedImplCopyWithImpl<_$LoadFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return loadFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return loadFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadFailed implements PurchaseOrderState {
  const factory _LoadFailed(final String message) = _$LoadFailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LoadFailedImplCopyWith<_$LoadFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatingImplCopyWith<$Res> {
  factory _$$CreatingImplCopyWith(
          _$CreatingImpl value, $Res Function(_$CreatingImpl) then) =
      __$$CreatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatingImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$CreatingImpl>
    implements _$$CreatingImplCopyWith<$Res> {
  __$$CreatingImplCopyWithImpl(
      _$CreatingImpl _value, $Res Function(_$CreatingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreatingImpl implements _Creating {
  const _$CreatingImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.creating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return creating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return creating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return creating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return creating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(this);
    }
    return orElse();
  }
}

abstract class _Creating implements PurchaseOrderState {
  const factory _Creating() = _$CreatingImpl;
}

/// @nodoc
abstract class _$$SavingImplCopyWith<$Res> {
  factory _$$SavingImplCopyWith(
          _$SavingImpl value, $Res Function(_$SavingImpl) then) =
      __$$SavingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavingImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$SavingImpl>
    implements _$$SavingImplCopyWith<$Res> {
  __$$SavingImplCopyWithImpl(
      _$SavingImpl _value, $Res Function(_$SavingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavingImpl implements _Saving {
  const _$SavingImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.saving()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SavingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving implements PurchaseOrderState {
  const factory _Saving() = _$SavingImpl;
}

/// @nodoc
abstract class _$$MarkingAsShippedWithNewItemsImplCopyWith<$Res> {
  factory _$$MarkingAsShippedWithNewItemsImplCopyWith(
          _$MarkingAsShippedWithNewItemsImpl value,
          $Res Function(_$MarkingAsShippedWithNewItemsImpl) then) =
      __$$MarkingAsShippedWithNewItemsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkingAsShippedWithNewItemsImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res,
        _$MarkingAsShippedWithNewItemsImpl>
    implements _$$MarkingAsShippedWithNewItemsImplCopyWith<$Res> {
  __$$MarkingAsShippedWithNewItemsImplCopyWithImpl(
      _$MarkingAsShippedWithNewItemsImpl _value,
      $Res Function(_$MarkingAsShippedWithNewItemsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MarkingAsShippedWithNewItemsImpl
    implements _MarkingAsShippedWithNewItems {
  const _$MarkingAsShippedWithNewItemsImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.markingAsShippedWithNewItems()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkingAsShippedWithNewItemsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return markingAsShippedWithNewItems();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return markingAsShippedWithNewItems?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (markingAsShippedWithNewItems != null) {
      return markingAsShippedWithNewItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return markingAsShippedWithNewItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return markingAsShippedWithNewItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (markingAsShippedWithNewItems != null) {
      return markingAsShippedWithNewItems(this);
    }
    return orElse();
  }
}

abstract class _MarkingAsShippedWithNewItems implements PurchaseOrderState {
  const factory _MarkingAsShippedWithNewItems() =
      _$MarkingAsShippedWithNewItemsImpl;
}

/// @nodoc
abstract class _$$MarkingAsShippedImplCopyWith<$Res> {
  factory _$$MarkingAsShippedImplCopyWith(_$MarkingAsShippedImpl value,
          $Res Function(_$MarkingAsShippedImpl) then) =
      __$$MarkingAsShippedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkingAsShippedImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$MarkingAsShippedImpl>
    implements _$$MarkingAsShippedImplCopyWith<$Res> {
  __$$MarkingAsShippedImplCopyWithImpl(_$MarkingAsShippedImpl _value,
      $Res Function(_$MarkingAsShippedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MarkingAsShippedImpl implements _MarkingAsShipped {
  const _$MarkingAsShippedImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.markingAsShipped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarkingAsShippedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return markingAsShipped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return markingAsShipped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (markingAsShipped != null) {
      return markingAsShipped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return markingAsShipped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return markingAsShipped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (markingAsShipped != null) {
      return markingAsShipped(this);
    }
    return orElse();
  }
}

abstract class _MarkingAsShipped implements PurchaseOrderState {
  const factory _MarkingAsShipped() = _$MarkingAsShippedImpl;
}

/// @nodoc
abstract class _$$MarkingAsReceivedImplCopyWith<$Res> {
  factory _$$MarkingAsReceivedImplCopyWith(_$MarkingAsReceivedImpl value,
          $Res Function(_$MarkingAsReceivedImpl) then) =
      __$$MarkingAsReceivedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkingAsReceivedImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$MarkingAsReceivedImpl>
    implements _$$MarkingAsReceivedImplCopyWith<$Res> {
  __$$MarkingAsReceivedImplCopyWithImpl(_$MarkingAsReceivedImpl _value,
      $Res Function(_$MarkingAsReceivedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MarkingAsReceivedImpl implements _MarkingAsReceived {
  const _$MarkingAsReceivedImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.markingAsReceived()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarkingAsReceivedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return markingAsReceived();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return markingAsReceived?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (markingAsReceived != null) {
      return markingAsReceived();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return markingAsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return markingAsReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (markingAsReceived != null) {
      return markingAsReceived(this);
    }
    return orElse();
  }
}

abstract class _MarkingAsReceived implements PurchaseOrderState {
  const factory _MarkingAsReceived() = _$MarkingAsReceivedImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder po});

  $PurchaseOrderCopyWith<$Res> get po;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? po = null,
  }) {
    return _then(_$SuccessImpl(
      null == po
          ? _value.po
          : po // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get po {
    return $PurchaseOrderCopyWith<$Res>(_value.po, (value) {
      return _then(_value.copyWith(po: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.po);

  @override
  final PurchaseOrder po;

  @override
  String toString() {
    return 'PurchaseOrderState.success(po: $po)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.po, po) || other.po == po));
  }

  @override
  int get hashCode => Object.hash(runtimeType, po);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return success(po);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(po);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(po);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PurchaseOrderState {
  const factory _Success(final PurchaseOrder po) = _$SuccessImpl;

  PurchaseOrder get po;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancellingImplCopyWith<$Res> {
  factory _$$CancellingImplCopyWith(
          _$CancellingImpl value, $Res Function(_$CancellingImpl) then) =
      __$$CancellingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancellingImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$CancellingImpl>
    implements _$$CancellingImplCopyWith<$Res> {
  __$$CancellingImplCopyWithImpl(
      _$CancellingImpl _value, $Res Function(_$CancellingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancellingImpl implements _Cancelling {
  const _$CancellingImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.cancelling()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancellingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return cancelling();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return cancelling?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (cancelling != null) {
      return cancelling();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return cancelling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return cancelling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (cancelling != null) {
      return cancelling(this);
    }
    return orElse();
  }
}

abstract class _Cancelling implements PurchaseOrderState {
  const factory _Cancelling() = _$CancellingImpl;
}

/// @nodoc
abstract class _$$CancelledImplCopyWith<$Res> {
  factory _$$CancelledImplCopyWith(
          _$CancelledImpl value, $Res Function(_$CancelledImpl) then) =
      __$$CancelledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$CancelledImpl>
    implements _$$CancelledImplCopyWith<$Res> {
  __$$CancelledImplCopyWithImpl(
      _$CancelledImpl _value, $Res Function(_$CancelledImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelledImpl implements _Cancelled {
  const _$CancelledImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.cancelled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class _Cancelled implements PurchaseOrderState {
  const factory _Cancelled() = _$CancelledImpl;
}

/// @nodoc
abstract class _$$DeletingImplCopyWith<$Res> {
  factory _$$DeletingImplCopyWith(
          _$DeletingImpl value, $Res Function(_$DeletingImpl) then) =
      __$$DeletingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletingImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$DeletingImpl>
    implements _$$DeletingImplCopyWith<$Res> {
  __$$DeletingImplCopyWithImpl(
      _$DeletingImpl _value, $Res Function(_$DeletingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeletingImpl implements _Deleting {
  const _$DeletingImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.deleting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return deleting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return deleting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return deleting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return deleting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting(this);
    }
    return orElse();
  }
}

abstract class _Deleting implements PurchaseOrderState {
  const factory _Deleting() = _$DeletingImpl;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
          _$DeletedImpl value, $Res Function(_$DeletedImpl) then) =
      __$$DeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
      _$DeletedImpl _value, $Res Function(_$DeletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeletedImpl implements _Deleted {
  const _$DeletedImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.deleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements PurchaseOrderState {
  const factory _Deleted() = _$DeletedImpl;
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
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$FailureImpl>
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
    return 'PurchaseOrderState.failure(message: $message)';
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
    required TResult Function(PurchaseOrder po) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() creating,
    required TResult Function() saving,
    required TResult Function() markingAsShippedWithNewItems,
    required TResult Function() markingAsShipped,
    required TResult Function() markingAsReceived,
    required TResult Function(PurchaseOrder po) success,
    required TResult Function() cancelling,
    required TResult Function() cancelled,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PurchaseOrder po)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? creating,
    TResult? Function()? saving,
    TResult? Function()? markingAsShippedWithNewItems,
    TResult? Function()? markingAsShipped,
    TResult? Function()? markingAsReceived,
    TResult? Function(PurchaseOrder po)? success,
    TResult? Function()? cancelling,
    TResult? Function()? cancelled,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PurchaseOrder po)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? creating,
    TResult Function()? saving,
    TResult Function()? markingAsShippedWithNewItems,
    TResult Function()? markingAsShipped,
    TResult Function()? markingAsReceived,
    TResult Function(PurchaseOrder po)? success,
    TResult Function()? cancelling,
    TResult Function()? cancelled,
    TResult Function()? deleting,
    TResult Function()? deleted,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Saving value) saving,
    required TResult Function(_MarkingAsShippedWithNewItems value)
        markingAsShippedWithNewItems,
    required TResult Function(_MarkingAsShipped value) markingAsShipped,
    required TResult Function(_MarkingAsReceived value) markingAsReceived,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelling value) cancelling,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult? Function(_MarkingAsShipped value)? markingAsShipped,
    TResult? Function(_MarkingAsReceived value)? markingAsReceived,
    TResult? Function(_Success value)? success,
    TResult? Function(_Cancelling value)? cancelling,
    TResult? Function(_Cancelled value)? cancelled,
    TResult? Function(_Deleting value)? deleting,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Creating value)? creating,
    TResult Function(_Saving value)? saving,
    TResult Function(_MarkingAsShippedWithNewItems value)?
        markingAsShippedWithNewItems,
    TResult Function(_MarkingAsShipped value)? markingAsShipped,
    TResult Function(_MarkingAsReceived value)? markingAsReceived,
    TResult Function(_Success value)? success,
    TResult Function(_Cancelling value)? cancelling,
    TResult Function(_Cancelled value)? cancelled,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements PurchaseOrderState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
