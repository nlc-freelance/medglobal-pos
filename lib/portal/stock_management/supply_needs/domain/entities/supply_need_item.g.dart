// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_need_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplyNeedItem _$SupplyNeedItemFromJson(Map<String, dynamic> json) =>
    SupplyNeedItem(
      id: json['id'] as int?,
      branch: json['branch'] == null
          ? null
          : BranchPartial.fromJson(json['branch'] as Map<String, dynamic>),
      variantName: json['variantName'] as String?,
      sku: json['sku'] as String?,
      qty: json['qty'] as int?,
      warningStock: json['warningStock'] as int?,
      idealStock: json['idealStock'] as int?,
      suppliers: (json['suppliers'] as List<dynamic>?)
          ?.map((e) => Supplier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SupplyNeedItemToJson(SupplyNeedItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch': instance.branch,
      'variantName': instance.variantName,
      'sku': instance.sku,
      'qty': instance.qty,
      'warningStock': instance.warningStock,
      'idealStock': instance.idealStock,
      'suppliers': instance.suppliers,
    };
