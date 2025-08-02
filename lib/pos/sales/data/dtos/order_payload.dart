import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_item_payload.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';

part 'order_payload.g.dart';

@JsonSerializable()
class OrderPayload {
  final int registerId;
  final List<OrderItemPayload> items;
  final double amountPaid;

  OrderPayload({
    required this.registerId,
    required this.items,
    required this.amountPaid,
  });

  factory OrderPayload.fromJson(Map<String, dynamic> json) => _$OrderPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPayloadToJson(this);

  factory OrderPayload.fromDomain(int registerId, Order order) {
    if (order.amountPaid == null) {
      throw ArgumentError('Missing amountPaid');
    }

    return OrderPayload(
      registerId: registerId,
      items: order.items.map((item) => OrderItemPayload.fromDomain(item)).toList(),
      amountPaid: order.amountPaid,
    );
  }
}
