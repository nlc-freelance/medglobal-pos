// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantPayload _$VariantPayloadFromJson(Map<String, dynamic> json) =>
    VariantPayload(
      name: json['name'] as String?,
      id: json['id'] as int?,
      sku: json['sku'] as String?,
      warningStock: json['warningStock'] as int?,
      idealStock: json['idealStock'] as int?,
      cost: (json['cost'] as num?)?.toDouble(),
      suppliers:
          (json['suppliers'] as List<dynamic>?)?.map((e) => e as int).toList(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map(
              (e) => BranchInventoryPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VariantPayloadToJson(VariantPayload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'warningStock': instance.warningStock,
      'idealStock': instance.idealStock,
      'cost': instance.cost,
      'suppliers': instance.suppliers,
      'stores': instance.stores,
    };
