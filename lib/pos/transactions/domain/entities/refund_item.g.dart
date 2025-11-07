// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefundItemImpl _$$RefundItemImplFromJson(Map<String, dynamic> json) =>
    _$RefundItemImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      refundQuantity: json['refundQuantity'] as int?,
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discountType']),
      discount: (json['discount'] as num?)?.toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$RefundItemImplToJson(_$RefundItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
      'refundQuantity': instance.refundQuantity,
      'discountType': _$DiscountTypeEnumMap[instance.discountType],
      'discount': instance.discount,
      'discountedPrice': instance.discountedPrice,
      'subtotal': instance.subtotal,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.peso: 'peso',
  DiscountType.percentage: 'percentage',
};
