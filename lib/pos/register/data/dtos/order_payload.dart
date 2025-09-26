import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/register/data/dtos/order_item_payload.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order.dart';

part 'order_payload.g.dart';

@JsonSerializable()
class OrderPayload {
  final String transactionId;
  final int registerId;
  final List<OrderItemPayload> items;
  final double amountPaid;
  final int creationTimestamp;

  OrderPayload({
    required this.transactionId,
    required this.registerId,
    required this.items,
    required this.amountPaid,
    required this.creationTimestamp,
  });

  factory OrderPayload.fromJson(Map<String, dynamic> json) => _$OrderPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPayloadToJson(this);

  @override
  String toString() {
    return 'OrderPayload(registerId: $registerId, amountPaid: $amountPaid, items: $items)';
  }

  factory OrderPayload.fromDomain(
    int registerId,
    Order order,
    String receiptId,
    int creationTimestamp,
  ) {
    if (order.amountPaid == null) {
      throw ArgumentError('Missing amountPaid');
    }

    return OrderPayload(
      transactionId: receiptId,
      registerId: registerId,
      items: order.items.map((item) => OrderItemPayload.fromDomain(item)).toList(),
      amountPaid: order.amountPaid!,
      creationTimestamp: creationTimestamp,
    );
  }
}
