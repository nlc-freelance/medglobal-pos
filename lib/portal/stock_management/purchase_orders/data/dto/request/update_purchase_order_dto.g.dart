// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_purchase_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePurchaseOrderDtoSaveOrShipImpl
    _$$UpdatePurchaseOrderDtoSaveOrShipImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdatePurchaseOrderDtoSaveOrShipImpl(
          status: json['status'] as String,
          purchaseOrderDetails: (json['purchaseOrderDetails'] as List<dynamic>?)
              ?.map((e) => UpdatePurchaseOrderItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          estimatedDateOfArrival: json['estimatedDateOfArrival'] as String?,
          tax: (json['tax'] as num?)?.toDouble(),
          discount: (json['discount'] as num?)?.toDouble(),
          notes: json['notes'] as String?,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UpdatePurchaseOrderDtoSaveOrShipImplToJson(
        _$UpdatePurchaseOrderDtoSaveOrShipImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'purchaseOrderDetails': instance.purchaseOrderDetails,
      'estimatedDateOfArrival': instance.estimatedDateOfArrival,
      'tax': instance.tax,
      'discount': instance.discount,
      'notes': instance.notes,
      'runtimeType': instance.$type,
    };

_$UpdatePurchaseOrderDtoReceiveImpl
    _$$UpdatePurchaseOrderDtoReceiveImplFromJson(Map<String, dynamic> json) =>
        _$UpdatePurchaseOrderDtoReceiveImpl(
          status: json['status'] as String,
          purchaseOrderDetails: (json['purchaseOrderDetails'] as List<dynamic>?)
              ?.map((e) => UpdatePurchaseOrderItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          notes: json['notes'] as String?,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UpdatePurchaseOrderDtoReceiveImplToJson(
        _$UpdatePurchaseOrderDtoReceiveImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'purchaseOrderDetails': instance.purchaseOrderDetails,
      'notes': instance.notes,
      'runtimeType': instance.$type,
    };

_$UpdatePurchaseOrderDtoCancelImpl _$$UpdatePurchaseOrderDtoCancelImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePurchaseOrderDtoCancelImpl(
      status: json['status'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UpdatePurchaseOrderDtoCancelImplToJson(
        _$UpdatePurchaseOrderDtoCancelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'runtimeType': instance.$type,
    };
