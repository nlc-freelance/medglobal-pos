// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_inventory_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchInventoryPayload _$BranchInventoryPayloadFromJson(
        Map<String, dynamic> json) =>
    BranchInventoryPayload(
      id: json['id'] as int?,
      store: json['store'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      currentStock: json['currentStock'] as int?,
    );

Map<String, dynamic> _$BranchInventoryPayloadToJson(
        BranchInventoryPayload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store': instance.store,
      'price': instance.price,
      'currentStock': instance.currentStock,
    };
