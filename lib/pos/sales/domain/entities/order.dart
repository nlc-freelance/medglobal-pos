import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    // required RegisterPartial register,
    // required BranchPartial branch,
    // required EmployeePartial employee,

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
  double subtotal() {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  /// Total amount of discount applied
  double totalDiscountAmount() {
    return items.fold(0.0, (sum, item) => sum + item.totalDiscountAmount);
  }

  /// Total amount due after all discounts
  double grandTotal() {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  /// Total number of items
  int totalQuantity() {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}
