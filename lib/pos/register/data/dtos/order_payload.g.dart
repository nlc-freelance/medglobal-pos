// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPayload _$OrderPayloadFromJson(Map<String, dynamic> json) => OrderPayload(
      transactionId: json['transactionId'] as String,
      registerId: json['registerId'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
      amountPaid: (json['amountPaid'] as num).toDouble(),
      creationTimestamp: json['creationTimestamp'] as int,
    );

Map<String, dynamic> _$OrderPayloadToJson(OrderPayload instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'registerId': instance.registerId,
      'items': instance.items,
      'amountPaid': instance.amountPaid,
      'creationTimestamp': instance.creationTimestamp,
    };
