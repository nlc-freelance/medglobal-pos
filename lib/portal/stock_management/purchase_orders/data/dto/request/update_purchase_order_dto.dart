import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/update_purchase_order_item_dto.dart';

part 'update_purchase_order_dto.freezed.dart';
part 'update_purchase_order_dto.g.dart';

@freezed
class UpdatePurchaseOrderDto with _$UpdatePurchaseOrderDto {
  const factory UpdatePurchaseOrderDto.saveOrShip({
    required String status,
    List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
    String? estimatedDateOfArrival,
    double? tax,
    double? discount,
    String? notes,
  }) = UpdatePurchaseOrderDtoSaveOrShip;

  // const factory UpdatePurchaseOrderDto.saveAndMarkAsShippedWithNewItems({
  //   required int variantId,
  //   int? orderedQuantity,
  //   required double supplierPrice,
  // }) = UpdatePurchaseOrderDtoSaveAndMarkAsShippedWithNewItems;

  // const factory UpdatePurchaseOrderDto.saveAndMarkAsShipped({
  //   required int variantId,
  //   int? orderedQuantity,
  //   required double supplierPrice,
  // }) = UpdatePurchaseOrderDtoSaveAndMarkAsShipped;

  const factory UpdatePurchaseOrderDto.receive({
    required String status,
    required List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
    String? notes,
  }) = UpdatePurchaseOrderDtoReceive;

  const factory UpdatePurchaseOrderDto.cancel({
    required String status,
  }) = UpdatePurchaseOrderDtoCancel;

  factory UpdatePurchaseOrderDto.fromJson(Map<String, dynamic> json) => _$UpdatePurchaseOrderDtoFromJson(json);
}
