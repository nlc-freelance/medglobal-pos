// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_need_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplyNeedItemDto _$SupplyNeedItemDtoFromJson(Map<String, dynamic> json) =>
    SupplyNeedItemDto(
      id: json['id'] as int?,
      branchId: json['storeId'] as int?,
      variant: json['variant'] == null
          ? null
          : ProductVariantDto.fromJson(json['variant'] as Map<String, dynamic>),
      qty: json['currentStock'] as int?,
    );

Map<String, dynamic> _$SupplyNeedItemDtoToJson(SupplyNeedItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storeId': instance.branchId,
      'variant': instance.variant,
      'currentStock': instance.qty,
    };
