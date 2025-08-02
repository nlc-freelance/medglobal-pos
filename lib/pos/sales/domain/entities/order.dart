import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order_item.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required RegisterPartial register,
    required BranchPartial branch,
    required EmployeePartial employee,

    /// Items added in cart
    @Default([]) List<OrderItem> items,

    /// Total amount due
    // @Default(0.0) double total,

    /// Amount customer gave as payment
    required double amountPaid,
  }) = _Order;
}

extension OrderExt on Order {
  /// Total amount before discounts
  double get subtotal {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  /// Total amount of discount applied
  double get totalDiscountAmount {
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
