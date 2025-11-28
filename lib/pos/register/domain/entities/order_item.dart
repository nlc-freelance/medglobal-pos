import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int id,
    required int itemId,
    required String itemName,
    @Default(1) int quantity,

    /// Unit price before discount
    required double price,

    /// Discount category (Senior Citizen, Solo Parent, PWD, Generic)
    DiscountCategory? discount,

    /// Currently, only percentage is supported
    @Default(DiscountType.percentage) DiscountType? discountType,

    /// Unit price after discount
    // double? discountedPrice,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

extension OrderItemExt on OrderItem {
  // If item has discount applied
  bool get hasDiscountApplied => discount != null;

  /// Discount amount per item
  double get discountAmountPerUnit {
    if (discount != null) return price * (discount!.value / 100);
    return 0;
  }

  /// Unit price after discount
  double get discountedUnitPrice {
    return price - discountAmountPerUnit;
  }

  /// Subtotal (before any discounts, per item * quantity)
  double get subtotal {
    return price * quantity;
  }

  /// Total discount amount (per item * quantity)
  double get totalDiscountAmount {
    return (price * quantity) - totalPrice;
  }

  /// Total price (per item * quantity)
  double get totalPrice {
    return discountedUnitPrice * quantity;
  }
}
