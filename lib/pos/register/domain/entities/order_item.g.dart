// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['id'] as int,
      itemId: json['itemId'] as int,
      itemName: json['itemName'] as String,
      quantity: json['quantity'] as int? ?? 1,
      price: (json['price'] as num).toDouble(),
      discount:
          $enumDecodeNullable(_$DiscountCategoryEnumMap, json['discount']),
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discountType']) ??
              DiscountType.percentage,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'price': instance.price,
      'discount': _$DiscountCategoryEnumMap[instance.discount],
      'discountType': _$DiscountTypeEnumMap[instance.discountType],
    };

const _$DiscountCategoryEnumMap = {
  DiscountCategory.SENIOR_DISCOUNT: 'SENIOR_DISCOUNT',
  DiscountCategory.SOLO_PARENT_DISCOUNT: 'SOLO_PARENT_DISCOUNT',
  DiscountCategory.PWD_DISCOUNT: 'PWD_DISCOUNT',
  DiscountCategory.GENERIC_DISCOUNT: 'GENERIC_DISCOUNT',
};

const _$DiscountTypeEnumMap = {
  DiscountType.peso: 'peso',
  DiscountType.percentage: 'percentage',
};
