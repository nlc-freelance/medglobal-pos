import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';

// part 'purchase_order_item_dto.g.dart';

// @JsonSerializable()
// class PurchaseOrderItemDto extends Equatable {
//   final int? id;
//   final VariantPartialDto? variant;
//   @JsonKey(name: 'orderedQuantity')
//   final int? qtyToOrder;
//   @JsonKey(name: 'actualQuantity')
//   final int? qtyReceived;
//   final double? supplierPrice;
//   @JsonKey(name: 'price')
//   final double? sellingPrice;

//   const PurchaseOrderItemDto({
//     this.id,
//     this.variant,
//     this.qtyToOrder,
//     this.qtyReceived,
//     this.supplierPrice,
//     this.sellingPrice,
//   });

//   @override
//   List<Object?> get props => [id, variant, qtyToOrder, qtyReceived, supplierPrice, sellingPrice];

//   factory PurchaseOrderItemDto.fromJson(Map<String, dynamic> json) => _$PurchaseOrderItemDtoFromJson(json);

//   PurchaseOrderItem toEntity() => PurchaseOrderItem(
//         id: id,
//         variantId: variant?.id,
//         name: '${variant?.product?.name} ${variant?.name}',
//         sku: variant?.sku,
//         qtyOnHand: variant?.currentStock,
//         qtyToOrder: qtyToOrder,
//         qtyReceived: qtyReceived,
//         supplierPrice: supplierPrice,
//         sellingPrice: sellingPrice ?? 0,
//         total: (qtyToOrder ?? 0) * (supplierPrice ?? 0),
//       );
// }

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
        name: variant?.name == 'default' ? variant?.product!.name : '${variant?.product?.name} ${variant?.name}',
        sku: variant?.sku,
        quantityOnHand: variant?.qtyOnHand,
        quantityOrdered: orderedQuantity,
        quantityReceived: actualQuantity,
        supplierPrice: supplierPrice,
        sellingPrice: price ?? 0,
        total: (orderedQuantity ?? 0) * (supplierPrice ?? 0),
      );
}
