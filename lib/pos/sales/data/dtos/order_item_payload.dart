import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order_item.dart';

part 'order_item_payload.g.dart';

@JsonSerializable()
class OrderItemPayload {
  final int variantId;
  final int quantity;
  final double? discount;
  final String? discountType;

  OrderItemPayload({
    required this.variantId,
    required this.quantity,
    required this.discount,
    required this.discountType,
  });

  factory OrderItemPayload.fromJson(Map<String, dynamic> json) => _$OrderItemPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemPayloadToJson(this);

  @override
  String toString() {
    return 'OrderItemPayload(variantId: $variantId, quantity: $quantity, discount: $discount, discountType: $discountType)';
  }

  factory OrderItemPayload.fromDomain(OrderItem item) => OrderItemPayload(
        variantId: item.itemId,
        quantity: item.quantity,
        discount: item.discount?.value,
        discountType: item.discountType?.name,
      );
}
