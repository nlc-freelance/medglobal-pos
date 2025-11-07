// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VariantDtoImpl _$$VariantDtoImplFromJson(Map<String, dynamic> json) =>
    _$VariantDtoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      sku: json['sku'] as String,
      warningStock: json['warningStock'] as int?,
      idealStock: json['idealStock'] as int?,
      cost: (json['cost'] as num).toDouble(),
      suppliers: (json['suppliers'] as List<dynamic>)
          .map((e) => SupplierDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      variantStoreDetails: (json['variantStoreDetails'] as List<dynamic>)
          .map((e) => BranchInventoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VariantDtoImplToJson(_$VariantDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'warningStock': instance.warningStock,
      'idealStock': instance.idealStock,
      'cost': instance.cost,
      'suppliers': instance.suppliers,
      'variantStoreDetails': instance.variantStoreDetails,
    };
