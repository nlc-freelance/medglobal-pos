// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderItem {
  int get id => throw _privateConstructorUsedError;
  int get itemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Unit price before discount
  double get price => throw _privateConstructorUsedError;

  /// Discount category (Senior Citizen, Solo Parent, PWD, Generic)
  DiscountCategory? get discount => throw _privateConstructorUsedError;

  /// Currently, only percentage is supported
  DiscountType? get discountType => throw _privateConstructorUsedError;

  /// Unit price after discount
  double? get discountedPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {int id,
      int itemId,
      String itemName,
      int quantity,
      double price,
      DiscountCategory? discount,
      DiscountType? discountType,
      double? discountedPrice});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? itemName = null,
    Object? quantity = null,
    Object? price = null,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? discountedPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as DiscountCategory?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int itemId,
      String itemName,
      int quantity,
      double price,
      DiscountCategory? discount,
      DiscountType? discountType,
      double? discountedPrice});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? itemName = null,
    Object? quantity = null,
    Object? price = null,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? discountedPrice = freezed,
  }) {
    return _then(_$OrderItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as DiscountCategory?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.id,
      required this.itemId,
      required this.itemName,
      this.quantity = 1,
      required this.price,
      this.discount,
      this.discountType = DiscountType.percentage,
      this.discountedPrice});

  @override
  final int id;
  @override
  final int itemId;
  @override
  final String itemName;
  @override
  @JsonKey()
  final int quantity;

  /// Unit price before discount
  @override
  final double price;

  /// Discount category (Senior Citizen, Solo Parent, PWD, Generic)
  @override
  final DiscountCategory? discount;

  /// Currently, only percentage is supported
  @override
  @JsonKey()
  final DiscountType? discountType;

  /// Unit price after discount
  @override
  final double? discountedPrice;

  @override
  String toString() {
    return 'OrderItem(id: $id, itemId: $itemId, itemName: $itemName, quantity: $quantity, price: $price, discount: $discount, discountType: $discountType, discountedPrice: $discountedPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, itemId, itemName, quantity,
      price, discount, discountType, discountedPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {required final int id,
      required final int itemId,
      required final String itemName,
      final int quantity,
      required final double price,
      final DiscountCategory? discount,
      final DiscountType? discountType,
      final double? discountedPrice}) = _$OrderItemImpl;

  @override
  int get id;
  @override
  int get itemId;
  @override
  String get itemName;
  @override
  int get quantity;
  @override

  /// Unit price before discount
  double get price;
  @override

  /// Discount category (Senior Citizen, Solo Parent, PWD, Generic)
  DiscountCategory? get discount;
  @override

  /// Currently, only percentage is supported
  DiscountType? get discountType;
  @override

  /// Unit price after discount
  double? get discountedPrice;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
