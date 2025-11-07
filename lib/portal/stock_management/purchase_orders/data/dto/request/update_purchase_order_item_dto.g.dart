// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_purchase_order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePurchaseOrderItemDtoSaveImpl
    _$$UpdatePurchaseOrderItemDtoSaveImplFromJson(Map<String, dynamic> json) =>
        _$UpdatePurchaseOrderItemDtoSaveImpl(
          variantId: json['variantId'] as int,
          orderedQuantity: json['orderedQuantity'] as int?,
          supplierPrice: (json['supplierPrice'] as num).toDouble(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UpdatePurchaseOrderItemDtoSaveImplToJson(
        _$UpdatePurchaseOrderItemDtoSaveImpl instance) =>
    <String, dynamic>{
      'variantId': instance.variantId,
      'orderedQuantity': instance.orderedQuantity,
      'supplierPrice': instance.supplierPrice,
      'runtimeType': instance.$type,
    };

_$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl
    _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl(
          variantId: json['variantId'] as int,
          orderedQuantity: json['orderedQuantity'] as int,
          supplierPrice: (json['supplierPrice'] as num).toDouble(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplToJson(
            _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl
                instance) =>
        <String, dynamic>{
          'variantId': instance.variantId,
          'orderedQuantity': instance.orderedQuantity,
          'supplierPrice': instance.supplierPrice,
          'runtimeType': instance.$type,
        };

_$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl
    _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl(
          id: json['id'] as int,
          orderedQuantity: json['orderedQuantity'] as int,
          supplierPrice: (json['supplierPrice'] as num).toDouble(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplToJson(
            _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl instance) =>
        <String, dynamic>{
          'id': instance.id,
          'orderedQuantity': instance.orderedQuantity,
          'supplierPrice': instance.supplierPrice,
          'runtimeType': instance.$type,
        };

_$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl
    _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl(
          id: json['id'] as int,
          receivedQuantity: json['receivedQuantity'] as int,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplToJson(
        _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receivedQuantity': instance.receivedQuantity,
      'runtimeType': instance.$type,
    };
