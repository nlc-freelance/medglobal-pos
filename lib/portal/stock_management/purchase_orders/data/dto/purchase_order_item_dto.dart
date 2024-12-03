import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';

part 'purchase_order_item_dto.g.dart';

@JsonSerializable()
class PurchaseOrderItemDto extends Equatable {
  final int? id;
  final ProductVariantDto? variant;
  @JsonKey(name: 'orderedQuantity')
  final int? qtyToOrder;
  @JsonKey(name: 'actualQuantity')
  final int? qtyReceived;
  final double? supplierPrice;
  final double? sellingPrice;

  const PurchaseOrderItemDto({
    this.id,
    this.variant,
    this.qtyToOrder,
    this.qtyReceived,
    this.supplierPrice,
    this.sellingPrice,
  });

  @override
  List<Object?> get props => [id, variant, qtyToOrder, qtyReceived, supplierPrice, sellingPrice];

  factory PurchaseOrderItemDto.fromJson(Map<String, dynamic> json) => _$PurchaseOrderItemDtoFromJson(json);

  PurchaseOrderItem toEntity() => PurchaseOrderItem(
        id: id,
        variantId: variant?.id,
        name: '${variant?.product?.name} ${variant?.name}',
        sku: variant?.sku,
        qtyOnHand: variant?.qtyOnHand,
        qtyToOrder: qtyToOrder,
        qtyReceived: qtyReceived,
        supplierPrice: supplierPrice,
        sellingPrice: sellingPrice ?? 0,
        total: (qtyToOrder ?? 0) * (supplierPrice ?? 0),
      );
}
