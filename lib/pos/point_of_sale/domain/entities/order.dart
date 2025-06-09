import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    /// Items added in cart
    @Default([]) List<OrderItem> items,

    /// Total amount due
    @Default(0.0) double total,

    /// Amount customer gave as payment
    double? amountPaid,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

extension OrderExt on Order {
  /// Total amount before discounts
  double get subtotal {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  /// Total amount of discount applied
  double get totalDiscount {
    return items.fold(0.0, (sum, item) => sum + item.totalDiscountAmount);
  }

  /// Total amound due after all discounts
  double get total {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  /// Total number of items
  int get totalQuantity {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}
