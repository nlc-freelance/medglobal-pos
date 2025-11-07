import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_purchase_order_item_dto.freezed.dart';
part 'update_purchase_order_item_dto.g.dart';

@freezed
class UpdatePurchaseOrderItemDto with _$UpdatePurchaseOrderItemDto {
  const factory UpdatePurchaseOrderItemDto.save({
    required int variantId,
    int? orderedQuantity,
    required double supplierPrice,
  }) = UpdatePurchaseOrderItemDtoSave;

  const factory UpdatePurchaseOrderItemDto.saveAndMarkAsShippedWithNewItems({
    required int variantId,
    required int orderedQuantity,
    required double supplierPrice,
  }) = UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems;

  const factory UpdatePurchaseOrderItemDto.saveAndMarkAsShipped({
    required int id,
    required int orderedQuantity,
    required double supplierPrice,
  }) = UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped;

  const factory UpdatePurchaseOrderItemDto.saveAndReceived({
    required int id,
    required int receivedQuantity,
  }) = UpdatePurchaseOrderItemDtoSaveAndReceived;

  factory UpdatePurchaseOrderItemDto.fromJson(Map<String, dynamic> json) => _$UpdatePurchaseOrderItemDtoFromJson(json);
}
