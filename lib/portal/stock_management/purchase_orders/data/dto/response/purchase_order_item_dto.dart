import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';

part 'purchase_order_item_dto.freezed.dart';
part 'purchase_order_item_dto.g.dart';

@freezed
class PurchaseOrderItemDto with _$PurchaseOrderItemDto {
  const factory PurchaseOrderItemDto({
    required int id,
    ProductVariantDto? variant,
    int? orderedQuantity,
    int? actualQuantity,
    double? supplierPrice,
    double? price,
  }) = _PurchaseOrderItemDto;

  const PurchaseOrderItemDto._();

  factory PurchaseOrderItemDto.fromJson(Map<String, dynamic> json) => _$PurchaseOrderItemDtoFromJson(json);

  PurchaseOrderItem toDomain() => PurchaseOrderItem(
        id: id,
        variantId: variant?.id,
        name: variant?.productVariantName,
        sku: variant?.sku,
        quantityOnHand: variant?.qtyOnHand,
        quantityOrdered: orderedQuantity,
        quantityReceived: actualQuantity,
        supplierPrice: supplierPrice,
        sellingPrice: price ?? 0,
        total: (orderedQuantity ?? 0) * (supplierPrice ?? 0),
      );
}
