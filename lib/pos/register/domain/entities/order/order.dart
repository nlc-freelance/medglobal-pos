import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order_item.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends Equatable {
  final int? id;
  final double? subtotal;
  final double? discount;
  final double? discountInPeso;
  final DiscountType? discountType;
  final double? tax;
  final double? total;
  final double? cash;
  final List<OrderItem>? items;

  const Order({
    this.id,
    this.subtotal,
    this.discount,
    this.discountInPeso,
    this.discountType,
    this.tax,
    this.total,
    this.cash,
    this.items,
  });

  @override
  List<Object?> get props => [id, subtotal, discount, discountInPeso, discountType, tax, total, cash, items];

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Order copyWith({
    int? id,
    double? subtotal,
    double? discount,
    double? discountInPeso,
    DiscountType? discountType,
    double? tax,
    double? total,
    double? cash,
    List<OrderItem>? items,
  }) {
    return Order(
      id: id ?? this.id,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      discountInPeso: discountInPeso ?? this.discountInPeso,
      discountType: discountType ?? this.discountType,
      tax: tax ?? this.tax,
      total: total ?? this.total,
      cash: cash ?? this.cash,
      items: items ?? this.items,
    );
  }

  bool hasChangedInSubtotalDiscountOrType(Order other) {
    return subtotal != other.subtotal ||
        items != other.items ||
        discount != other.discount ||
        discountInPeso != other.discountInPeso ||
        discountType != other.discountType;
  }

  JSON toPayload(int registerId) => {
        'registerId': registerId,
        'discount': discount,
        'discountType': discountType == DiscountType.PERCENT ? 'percentage' : 'fixed',
        'tax': tax,
        'total': total,
        'amountPaid': cash,
        'items': items
                ?.map((item) => {
                      'variantId': item.itemId,
                      'quantity': item.qty,
                      'discount': item.discount,
                      'discountType': item.discountType == DiscountType.PERCENT ? 'percentage' : 'fixed',
                    })
                .toList() ??
            [],
      };

  double get totalDiscountFromAllItems => items?.any((item) => item.discountCategory != null) == true
      ? items?.map((item) => (item.discountInPeso ?? 0) * item.qty!).reduce((a, b) => a + b) ?? 0
      : 0;
}
