// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrderFormState {
  PurchaseOrder get purchaseOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseOrderFormStateCopyWith<PurchaseOrderFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderFormStateCopyWith<$Res> {
  factory $PurchaseOrderFormStateCopyWith(PurchaseOrderFormState value,
          $Res Function(PurchaseOrderFormState) then) =
      _$PurchaseOrderFormStateCopyWithImpl<$Res, PurchaseOrderFormState>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class _$PurchaseOrderFormStateCopyWithImpl<$Res,
        $Val extends PurchaseOrderFormState>
    implements $PurchaseOrderFormStateCopyWith<$Res> {
  _$PurchaseOrderFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_value.copyWith(
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseOrderFormStateImplCopyWith<$Res>
    implements $PurchaseOrderFormStateCopyWith<$Res> {
  factory _$$PurchaseOrderFormStateImplCopyWith(
          _$PurchaseOrderFormStateImpl value,
          $Res Function(_$PurchaseOrderFormStateImpl) then) =
      __$$PurchaseOrderFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  @override
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$PurchaseOrderFormStateImplCopyWithImpl<$Res>
    extends _$PurchaseOrderFormStateCopyWithImpl<$Res,
        _$PurchaseOrderFormStateImpl>
    implements _$$PurchaseOrderFormStateImplCopyWith<$Res> {
  __$$PurchaseOrderFormStateImplCopyWithImpl(
      _$PurchaseOrderFormStateImpl _value,
      $Res Function(_$PurchaseOrderFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$PurchaseOrderFormStateImpl(
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }
}

/// @nodoc

class _$PurchaseOrderFormStateImpl extends _PurchaseOrderFormState {
  const _$PurchaseOrderFormStateImpl({required this.purchaseOrder}) : super._();

  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderFormState(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderFormStateImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderFormStateImplCopyWith<_$PurchaseOrderFormStateImpl>
      get copyWith => __$$PurchaseOrderFormStateImplCopyWithImpl<
          _$PurchaseOrderFormStateImpl>(this, _$identity);
}

abstract class _PurchaseOrderFormState extends PurchaseOrderFormState {
  const factory _PurchaseOrderFormState(
          {required final PurchaseOrder purchaseOrder}) =
      _$PurchaseOrderFormStateImpl;
  const _PurchaseOrderFormState._() : super._();

  @override
  PurchaseOrder get purchaseOrder;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseOrderFormStateImplCopyWith<_$PurchaseOrderFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
