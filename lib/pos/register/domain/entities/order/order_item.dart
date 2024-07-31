import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:medglobal_admin_portal/core/core.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem extends Equatable {
  final int? id;
  final int? itemId;
  final String? name;
  final int? qty;
  final double? price;
  final double? discountedPrice;
  final double? discount;
  final DiscountType? discountType;

  const OrderItem({
    this.id,
    this.itemId,
    this.name,
    this.qty,
    this.price,
    this.discountedPrice,
    this.discount,
    this.discountType,
  });

  @override
  List<Object?> get props => [id, itemId, name, qty, price, discountedPrice, discount, discountType];

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  OrderItem copyWith({
    int? id,
    int? itemId,
    String? name,
    int? qty,
    double? price,
    double? discountedPrice,
    double? discount,
    DiscountType? discountType,
  }) {
    return OrderItem(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      name: name ?? this.name,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
    );
  }

  double get totalPricePerItem {
    if (qty != null) {
      if (discountedPrice != null) return discountedPrice! * qty!;
      return price! * qty!;
    }
    return 0;
  }

  bool hasChangedInQtyDiscountOrTypePerItem(OrderItem other) {
    return qty != other.qty || discount != other.discount || discountType != other.discountType;
  }
}
