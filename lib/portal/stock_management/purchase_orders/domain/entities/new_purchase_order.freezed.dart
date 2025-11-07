// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_purchase_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewPurchaseOrder {
  int? get branchId => throw _privateConstructorUsedError;
  int? get supplierId => throw _privateConstructorUsedError;
  bool get isAutoFill => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPurchaseOrderCopyWith<NewPurchaseOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPurchaseOrderCopyWith<$Res> {
  factory $NewPurchaseOrderCopyWith(
          NewPurchaseOrder value, $Res Function(NewPurchaseOrder) then) =
      _$NewPurchaseOrderCopyWithImpl<$Res, NewPurchaseOrder>;
  @useResult
  $Res call({int? branchId, int? supplierId, bool isAutoFill});
}

/// @nodoc
class _$NewPurchaseOrderCopyWithImpl<$Res, $Val extends NewPurchaseOrder>
    implements $NewPurchaseOrderCopyWith<$Res> {
  _$NewPurchaseOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchId = freezed,
    Object? supplierId = freezed,
    Object? isAutoFill = null,
  }) {
    return _then(_value.copyWith(
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAutoFill: null == isAutoFill
          ? _value.isAutoFill
          : isAutoFill // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPurchaseOrderImplCopyWith<$Res>
    implements $NewPurchaseOrderCopyWith<$Res> {
  factory _$$NewPurchaseOrderImplCopyWith(_$NewPurchaseOrderImpl value,
          $Res Function(_$NewPurchaseOrderImpl) then) =
      __$$NewPurchaseOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? branchId, int? supplierId, bool isAutoFill});
}

/// @nodoc
class __$$NewPurchaseOrderImplCopyWithImpl<$Res>
    extends _$NewPurchaseOrderCopyWithImpl<$Res, _$NewPurchaseOrderImpl>
    implements _$$NewPurchaseOrderImplCopyWith<$Res> {
  __$$NewPurchaseOrderImplCopyWithImpl(_$NewPurchaseOrderImpl _value,
      $Res Function(_$NewPurchaseOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchId = freezed,
    Object? supplierId = freezed,
    Object? isAutoFill = null,
  }) {
    return _then(_$NewPurchaseOrderImpl(
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAutoFill: null == isAutoFill
          ? _value.isAutoFill
          : isAutoFill // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewPurchaseOrderImpl implements _NewPurchaseOrder {
  const _$NewPurchaseOrderImpl(
      {this.branchId, this.supplierId, this.isAutoFill = false});

  @override
  final int? branchId;
  @override
  final int? supplierId;
  @override
  @JsonKey()
  final bool isAutoFill;

  @override
  String toString() {
    return 'NewPurchaseOrder(branchId: $branchId, supplierId: $supplierId, isAutoFill: $isAutoFill)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPurchaseOrderImpl &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.isAutoFill, isAutoFill) ||
                other.isAutoFill == isAutoFill));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, branchId, supplierId, isAutoFill);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPurchaseOrderImplCopyWith<_$NewPurchaseOrderImpl> get copyWith =>
      __$$NewPurchaseOrderImplCopyWithImpl<_$NewPurchaseOrderImpl>(
          this, _$identity);
}

abstract class _NewPurchaseOrder implements NewPurchaseOrder {
  const factory _NewPurchaseOrder(
      {final int? branchId,
      final int? supplierId,
      final bool isAutoFill}) = _$NewPurchaseOrderImpl;

  @override
  int? get branchId;
  @override
  int? get supplierId;
  @override
  bool get isAutoFill;
  @override
  @JsonKey(ignore: true)
  _$$NewPurchaseOrderImplCopyWith<_$NewPurchaseOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
