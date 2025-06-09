// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefundItem _$RefundItemFromJson(Map<String, dynamic> json) {
  return _RefundItem.fromJson(json);
}

/// @nodoc
mixin _$RefundItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  DiscountType? get discountType => throw _privateConstructorUsedError;
  double? get discountValue => throw _privateConstructorUsedError;
  double? get discountedPrice => throw _privateConstructorUsedError;
  int? get refundQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefundItemCopyWith<RefundItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundItemCopyWith<$Res> {
  factory $RefundItemCopyWith(
          RefundItem value, $Res Function(RefundItem) then) =
      _$RefundItemCopyWithImpl<$Res, RefundItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String sku,
      int quantity,
      double price,
      DiscountType? discountType,
      double? discountValue,
      double? discountedPrice,
      int? refundQuantity});
}

/// @nodoc
class _$RefundItemCopyWithImpl<$Res, $Val extends RefundItem>
    implements $RefundItemCopyWith<$Res> {
  _$RefundItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sku = null,
    Object? quantity = null,
    Object? price = null,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? discountedPrice = freezed,
    Object? refundQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      refundQuantity: freezed == refundQuantity
          ? _value.refundQuantity
          : refundQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefundItemImplCopyWith<$Res>
    implements $RefundItemCopyWith<$Res> {
  factory _$$RefundItemImplCopyWith(
          _$RefundItemImpl value, $Res Function(_$RefundItemImpl) then) =
      __$$RefundItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String sku,
      int quantity,
      double price,
      DiscountType? discountType,
      double? discountValue,
      double? discountedPrice,
      int? refundQuantity});
}

/// @nodoc
class __$$RefundItemImplCopyWithImpl<$Res>
    extends _$RefundItemCopyWithImpl<$Res, _$RefundItemImpl>
    implements _$$RefundItemImplCopyWith<$Res> {
  __$$RefundItemImplCopyWithImpl(
      _$RefundItemImpl _value, $Res Function(_$RefundItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sku = null,
    Object? quantity = null,
    Object? price = null,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? discountedPrice = freezed,
    Object? refundQuantity = freezed,
  }) {
    return _then(_$RefundItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      refundQuantity: freezed == refundQuantity
          ? _value.refundQuantity
          : refundQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundItemImpl extends _RefundItem {
  const _$RefundItemImpl(
      {required this.id,
      required this.name,
      required this.sku,
      required this.quantity,
      required this.price,
      this.discountType,
      this.discountValue,
      this.discountedPrice,
      this.refundQuantity})
      : super._();

  factory _$RefundItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String sku;
  @override
  final int quantity;
  @override
  final double price;
  @override
  final DiscountType? discountType;
  @override
  final double? discountValue;
  @override
  final double? discountedPrice;
  @override
  final int? refundQuantity;

  @override
  String toString() {
    return 'RefundItem(id: $id, name: $name, sku: $sku, quantity: $quantity, price: $price, discountType: $discountType, discountValue: $discountValue, discountedPrice: $discountedPrice, refundQuantity: $refundQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.refundQuantity, refundQuantity) ||
                other.refundQuantity == refundQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, sku, quantity, price,
      discountType, discountValue, discountedPrice, refundQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundItemImplCopyWith<_$RefundItemImpl> get copyWith =>
      __$$RefundItemImplCopyWithImpl<_$RefundItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundItemImplToJson(
      this,
    );
  }
}

abstract class _RefundItem extends RefundItem {
  const factory _RefundItem(
      {required final int id,
      required final String name,
      required final String sku,
      required final int quantity,
      required final double price,
      final DiscountType? discountType,
      final double? discountValue,
      final double? discountedPrice,
      final int? refundQuantity}) = _$RefundItemImpl;
  const _RefundItem._() : super._();

  factory _RefundItem.fromJson(Map<String, dynamic> json) =
      _$RefundItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get sku;
  @override
  int get quantity;
  @override
  double get price;
  @override
  DiscountType? get discountType;
  @override
  double? get discountValue;
  @override
  double? get discountedPrice;
  @override
  int? get refundQuantity;
  @override
  @JsonKey(ignore: true)
  _$$RefundItemImplCopyWith<_$RefundItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
