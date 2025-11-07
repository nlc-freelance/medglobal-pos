// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bulk_delete_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBulkDeletePayload _$ProductBulkDeletePayloadFromJson(
        Map<String, dynamic> json) =>
    ProductBulkDeletePayload(
      ids: (json['ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ProductBulkDeletePayloadToJson(
        ProductBulkDeletePayload instance) =>
    <String, dynamic>{
      'ids': instance.ids,
    };
