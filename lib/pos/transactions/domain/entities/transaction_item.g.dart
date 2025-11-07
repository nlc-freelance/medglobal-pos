// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionItemImpl _$$TransactionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionItemImpl(
      id: json['id'] as int?,
      itemId: json['itemId'] as int?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discountType']),
      discount: (json['discount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      restockQty: json['restockQty'] as int?,
      writeOffQty: json['writeOffQty'] as int?,
    );

Map<String, dynamic> _$$TransactionItemImplToJson(
        _$TransactionItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'name': instance.name,
      'sku': instance.sku,
      'price': instance.price,
      'quantity': instance.quantity,
      'discountType': _$DiscountTypeEnumMap[instance.discountType],
      'discount': instance.discount,
      'discountAmount': instance.discountAmount,
      'subtotal': instance.subtotal,
      'total': instance.total,
      'comment': instance.comment,
      'restockQty': instance.restockQty,
      'writeOffQty': instance.writeOffQty,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.peso: 'peso',
  DiscountType.percentage: 'percentage',
};
