// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionItemDtoImpl _$$TransactionItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionItemDtoImpl(
      id: json['id'] as int,
      variant: json['variant'] == null
          ? null
          : ProductVariantDto.fromJson(json['variant'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      price: json['price'] == null
          ? null
          : PriceDto.fromJson(json['price'] as Map<String, dynamic>),
      discount: (json['discount'] as num?)?.toDouble(),
      discountType: json['discountType'] as String?,
      discountInPeso: (json['discountInPeso'] as num?)?.toDouble(),
      subTotal: (json['subTotal'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      restockQuantity: json['restockQuantity'] as int?,
      writeOffQuantity: json['writeOffQuantity'] as int?,
    );

Map<String, dynamic> _$$TransactionItemDtoImplToJson(
        _$TransactionItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variant': instance.variant,
      'quantity': instance.quantity,
      'price': instance.price,
      'discount': instance.discount,
      'discountType': instance.discountType,
      'discountInPeso': instance.discountInPeso,
      'subTotal': instance.subTotal,
      'total': instance.total,
      'comment': instance.comment,
      'restockQuantity': instance.restockQuantity,
      'writeOffQuantity': instance.writeOffQuantity,
    };
