import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int id,
    required String name,
    required String sku,
    @Default(1) int quantity,

    /// Unit price before discount
    required double price,

    /// Unit price after discount
    double? discountedPrice,

    /// Currently, only percentage is supported
    @Default(DiscountType.percentage) DiscountType? discountType,

    /// Discount category (Senior Citizen, Solo Parent, PWD, Generic)
    DiscountCategory? discount,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

extension OrderItemExt on OrderItem {
  /// Discount amount per item
  double get discountAmountPerUnit {
    if (discount != null) return price * (discount!.value / 100);
    return 0;
  }

  /// Unit price after discount
  double get discountedUnitPrice {
    return price - discountAmountPerUnit;
  }

  /// Total price (per item * quantity)
  double get totalPrice {
    return discountedUnitPrice * quantity;
  }

  /// Total discount amount (per item * quantity)
  double get totalDiscountAmount {
    return (price * quantity) - totalPrice;
  }
}
