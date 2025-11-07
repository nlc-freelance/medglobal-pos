// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_purchase_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePurchaseOrderDto _$CreatePurchaseOrderDtoFromJson(
        Map<String, dynamic> json) =>
    CreatePurchaseOrderDto(
      branchId: json['branchId'] as int?,
      supplierId: json['supplierId'] as int?,
      isAutoFill: json['isAutoFill'] as bool? ?? false,
    );

Map<String, dynamic> _$CreatePurchaseOrderDtoToJson(
        CreatePurchaseOrderDto instance) =>
    <String, dynamic>{
      'branchId': instance.branchId,
      'supplierId': instance.supplierId,
      'isAutoFill': instance.isAutoFill,
    };
