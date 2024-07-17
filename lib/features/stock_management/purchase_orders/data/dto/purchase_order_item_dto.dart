import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/variant_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';

part 'purchase_order_item_dto.g.dart';

@JsonSerializable()
class PurchaseOrderItemDto extends Equatable {
  final int? id;
  final VariantDto? variant;
  @JsonKey(name: 'orderedQuantity')
  final int? qtyToOrder;
  @JsonKey(name: 'actualQuantity')
  final int? qtyReceived;
  final double? supplierPrice;

  const PurchaseOrderItemDto({
    this.id,
    this.variant,
    this.qtyToOrder,
    this.qtyReceived,
    this.supplierPrice,
  });

  @override
  List<Object?> get props => [id, variant, qtyToOrder, qtyReceived, supplierPrice];

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
        total: (qtyToOrder ?? 0) * (supplierPrice ?? 0),
      );
}
