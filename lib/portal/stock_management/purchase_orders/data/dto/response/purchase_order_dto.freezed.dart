// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderDto _$PurchaseOrderDtoFromJson(Map<String, dynamic> json) {
  return _PurchaseOrderDto.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderDto {
  int get id => throw _privateConstructorUsedError;
  BranchLiteDto? get store => throw _privateConstructorUsedError;
  SupplierDto? get supplier => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<PurchaseOrderItemDto>? get items => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get estimatedDateOfArrival => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseOrderDtoCopyWith<PurchaseOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderDtoCopyWith<$Res> {
  factory $PurchaseOrderDtoCopyWith(
          PurchaseOrderDto value, $Res Function(PurchaseOrderDto) then) =
      _$PurchaseOrderDtoCopyWithImpl<$Res, PurchaseOrderDto>;
  @useResult
  $Res call(
      {int id,
      BranchLiteDto? store,
      SupplierDto? supplier,
      String? status,
      double? totalAmount,
      double? tax,
      double? discount,
      String? notes,
      List<PurchaseOrderItemDto>? items,
      @DateTimeConverter() DateTime? estimatedDateOfArrival,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});

  $BranchLiteDtoCopyWith<$Res>? get store;
  $SupplierDtoCopyWith<$Res>? get supplier;
}

/// @nodoc
class _$PurchaseOrderDtoCopyWithImpl<$Res, $Val extends PurchaseOrderDto>
    implements $PurchaseOrderDtoCopyWith<$Res> {
  _$PurchaseOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? store = freezed,
    Object? supplier = freezed,
    Object? status = freezed,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BranchLiteDto?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierDto?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<PurchaseOrderItemDto>?,
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
  $BranchLiteDtoCopyWith<$Res>? get store {
    if (_value.store == null) {
      return null;
    }

    return $BranchLiteDtoCopyWith<$Res>(_value.store!, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierDtoCopyWith<$Res>? get supplier {
    if (_value.supplier == null) {
      return null;
    }

    return $SupplierDtoCopyWith<$Res>(_value.supplier!, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseOrderDtoImplCopyWith<$Res>
    implements $PurchaseOrderDtoCopyWith<$Res> {
  factory _$$PurchaseOrderDtoImplCopyWith(_$PurchaseOrderDtoImpl value,
          $Res Function(_$PurchaseOrderDtoImpl) then) =
      __$$PurchaseOrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      BranchLiteDto? store,
      SupplierDto? supplier,
      String? status,
      double? totalAmount,
      double? tax,
      double? discount,
      String? notes,
      List<PurchaseOrderItemDto>? items,
      @DateTimeConverter() DateTime? estimatedDateOfArrival,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});

  @override
  $BranchLiteDtoCopyWith<$Res>? get store;
  @override
  $SupplierDtoCopyWith<$Res>? get supplier;
}

/// @nodoc
class __$$PurchaseOrderDtoImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDtoCopyWithImpl<$Res, _$PurchaseOrderDtoImpl>
    implements _$$PurchaseOrderDtoImplCopyWith<$Res> {
  __$$PurchaseOrderDtoImplCopyWithImpl(_$PurchaseOrderDtoImpl _value,
      $Res Function(_$PurchaseOrderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? store = freezed,
    Object? supplier = freezed,
    Object? status = freezed,
    Object? totalAmount = freezed,
    Object? tax = freezed,
    Object? discount = freezed,
    Object? notes = freezed,
    Object? items = freezed,
    Object? estimatedDateOfArrival = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PurchaseOrderDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BranchLiteDto?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierDto?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<PurchaseOrderItemDto>?,
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
@JsonSerializable()
class _$PurchaseOrderDtoImpl extends _PurchaseOrderDto {
  const _$PurchaseOrderDtoImpl(
      {required this.id,
      this.store,
      this.supplier,
      this.status,
      this.totalAmount,
      this.tax,
      this.discount,
      this.notes,
      final List<PurchaseOrderItemDto>? items,
      @DateTimeConverter() this.estimatedDateOfArrival,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt})
      : _items = items,
        super._();

  factory _$PurchaseOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderDtoImplFromJson(json);

  @override
  final int id;
  @override
  final BranchLiteDto? store;
  @override
  final SupplierDto? supplier;
  @override
  final String? status;
  @override
  final double? totalAmount;
  @override
  final double? tax;
  @override
  final double? discount;
  @override
  final String? notes;
  final List<PurchaseOrderItemDto>? _items;
  @override
  List<PurchaseOrderItemDto>? get items {
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
    return 'PurchaseOrderDto(id: $id, store: $store, supplier: $supplier, status: $status, totalAmount: $totalAmount, tax: $tax, discount: $discount, notes: $notes, items: $items, estimatedDateOfArrival: $estimatedDateOfArrival, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.status, status) || other.status == status) &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      store,
      supplier,
      status,
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
  _$$PurchaseOrderDtoImplCopyWith<_$PurchaseOrderDtoImpl> get copyWith =>
      __$$PurchaseOrderDtoImplCopyWithImpl<_$PurchaseOrderDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderDtoImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderDto extends PurchaseOrderDto {
  const factory _PurchaseOrderDto(
      {required final int id,
      final BranchLiteDto? store,
      final SupplierDto? supplier,
      final String? status,
      final double? totalAmount,
      final double? tax,
      final double? discount,
      final String? notes,
      final List<PurchaseOrderItemDto>? items,
      @DateTimeConverter() final DateTime? estimatedDateOfArrival,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$PurchaseOrderDtoImpl;
  const _PurchaseOrderDto._() : super._();

  factory _PurchaseOrderDto.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderDtoImpl.fromJson;

  @override
  int get id;
  @override
  BranchLiteDto? get store;
  @override
  SupplierDto? get supplier;
  @override
  String? get status;
  @override
  double? get totalAmount;
  @override
  double? get tax;
  @override
  double? get discount;
  @override
  String? get notes;
  @override
  List<PurchaseOrderItemDto>? get items;
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
  _$$PurchaseOrderDtoImplCopyWith<_$PurchaseOrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
