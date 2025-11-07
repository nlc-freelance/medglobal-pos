// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_refund_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateRefundDtoImpl _$$CreateRefundDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRefundDtoImpl(
      registerId: json['registerId'] as int,
      saleTransactionId: json['saleTransactionId'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => CreateRefundItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$CreateRefundDtoImplToJson(
        _$CreateRefundDtoImpl instance) =>
    <String, dynamic>{
      'registerId': instance.registerId,
      'saleTransactionId': instance.saleTransactionId,
      'items': instance.items,
      'notes': instance.notes,
    };

_$CreateRefundItemDtoImpl _$$CreateRefundItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRefundItemDtoImpl(
      variantId: json['variantId'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$CreateRefundItemDtoImplToJson(
        _$CreateRefundItemDtoImpl instance) =>
    <String, dynamic>{
      'variantId': instance.variantId,
      'quantity': instance.quantity,
    };
