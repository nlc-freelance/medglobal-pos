// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrder {
  int? get id => throw _privateConstructorUsedError;
  BranchLite? get branch => throw _privateConstructorUsedError;
  Supplier? get supplier => throw _privateConstructorUsedError;
  StockOrderStatus? get status => throw _privateConstructorUsedError;
  double? get subtotal => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<PurchaseOrderItem>? get items => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get estimatedDateOfArrival => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseOrderCopyWith<PurchaseOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderCopyWith<$Res> {
  factory $PurchaseOrderCopyWith(
          PurchaseOrder value, $Res Function(PurchaseOrder) then) =
      _$PurchaseOrderCopyWithImpl<$Res, PurchaseOrder>;
  @useResult
  $Res call(
      {int? id,
      BranchLite? branch,
      Supplier? supplier,
      StockOrderStatus? status,
      double? subtotal,
      double? totalAmount,
      double? tax,
      double? discount,
      String? notes,
      List<PurchaseOrderItem>? items,
      @DateTimeConverter() DateTime? estimatedDateOfArrival,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});

  $BranchLiteCopyWith<$Res>? get branch;
  $SupplierCopyWith<$Res>? get supplier;
}

/// @nodoc
class _$PurchaseOrderCopyWithImpl<$Res, $Val extends PurchaseOrder>
    implements $PurchaseOrderCopyWith<$Res> {
  _$PurchaseOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branch = freezed,
    Object? supplier = freezed,
    Object? status = freezed,
    Object? subtotal = freezed,
    Object? totalAmount = freezed,
    Object? tax = freezed,
    Object? discount = freezed,
    Object? notes = freezed,
    Object? items = freezed,
    Object? estimatedDateOfArrival = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as BranchLite?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StockOrderStatus?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderItem>?,
      estimatedDateOfArrival: freezed == estimatedDateOfArrival
          ? _value.estimatedDateOfArrival
          : estimatedDateOfArrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchLiteCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $BranchLiteCopyWith<$Res>(_value.branch!, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get supplier {
    if (_value.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_value.supplier!, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseOrderImplCopyWith<$Res>
    implements $PurchaseOrderCopyWith<$Res> {
  factory _$$PurchaseOrderImplCopyWith(
          _$PurchaseOrderImpl value, $Res Function(_$PurchaseOrderImpl) then) =
      __$$PurchaseOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      BranchLite? branch,
      Supplier? supplier,
      StockOrderStatus? status,
      double? subtotal,
      double? totalAmount,
      double? tax,
      double? discount,
      String? notes,
      List<PurchaseOrderItem>? items,
      @DateTimeConverter() DateTime? estimatedDateOfArrival,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});

  @override
  $BranchLiteCopyWith<$Res>? get branch;
  @override
  $SupplierCopyWith<$Res>? get supplier;
}

/// @nodoc
class __$$PurchaseOrderImplCopyWithImpl<$Res>
    extends _$PurchaseOrderCopyWithImpl<$Res, _$PurchaseOrderImpl>
    implements _$$PurchaseOrderImplCopyWith<$Res> {
  __$$PurchaseOrderImplCopyWithImpl(
      _$PurchaseOrderImpl _value, $Res Function(_$PurchaseOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? branch = freezed,
    Object? supplier = freezed,
    Object? status = freezed,
    Object? subtotal = freezed,
    Object? totalAmount = freezed,
    Object? tax = freezed,
    Object? discount = freezed,
    Object? notes = freezed,
    Object? items = freezed,
    Object? estimatedDateOfArrival = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PurchaseOrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as BranchLite?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StockOrderStatus?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderItem>?,
      estimatedDateOfArrival: freezed == estimatedDateOfArrival
          ? _value.estimatedDateOfArrival
          : estimatedDateOfArrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PurchaseOrderImpl extends _PurchaseOrder {
  const _$PurchaseOrderImpl(
      {this.id,
      this.branch,
      this.supplier,
      this.status,
      this.subtotal,
      this.totalAmount,
      this.tax,
      this.discount,
      this.notes,
      final List<PurchaseOrderItem>? items,
      @DateTimeConverter() this.estimatedDateOfArrival,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt})
      : _items = items,
        super._();

  @override
  final int? id;
  @override
  final BranchLite? branch;
  @override
  final Supplier? supplier;
  @override
  final StockOrderStatus? status;
  @override
  final double? subtotal;
  @override
  final double? totalAmount;
  @override
  final double? tax;
  @override
  final double? discount;
  @override
  final String? notes;
  final List<PurchaseOrderItem>? _items;
  @override
  List<PurchaseOrderItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @DateTimeConverter()
  final DateTime? estimatedDateOfArrival;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PurchaseOrder(id: $id, branch: $branch, supplier: $supplier, status: $status, subtotal: $subtotal, totalAmount: $totalAmount, tax: $tax, discount: $discount, notes: $notes, items: $items, estimatedDateOfArrival: $estimatedDateOfArrival, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.estimatedDateOfArrival, estimatedDateOfArrival) ||
                other.estimatedDateOfArrival == estimatedDateOfArrival) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      branch,
      supplier,
      status,
      subtotal,
      totalAmount,
      tax,
      discount,
      notes,
      const DeepCollectionEquality().hash(_items),
      estimatedDateOfArrival,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderImplCopyWith<_$PurchaseOrderImpl> get copyWith =>
      __$$PurchaseOrderImplCopyWithImpl<_$PurchaseOrderImpl>(this, _$identity);
}

abstract class _PurchaseOrder extends PurchaseOrder {
  const factory _PurchaseOrder(
      {final int? id,
      final BranchLite? branch,
      final Supplier? supplier,
      final StockOrderStatus? status,
      final double? subtotal,
      final double? totalAmount,
      final double? tax,
      final double? discount,
      final String? notes,
      final List<PurchaseOrderItem>? items,
      @DateTimeConverter() final DateTime? estimatedDateOfArrival,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$PurchaseOrderImpl;
  const _PurchaseOrder._() : super._();

  @override
  int? get id;
  @override
  BranchLite? get branch;
  @override
  Supplier? get supplier;
  @override
  StockOrderStatus? get status;
  @override
  double? get subtotal;
  @override
  double? get totalAmount;
  @override
  double? get tax;
  @override
  double? get discount;
  @override
  String? get notes;
  @override
  List<PurchaseOrderItem>? get items;
  @override
  @DateTimeConverter()
  DateTime? get estimatedDateOfArrival;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseOrderImplCopyWith<_$PurchaseOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
