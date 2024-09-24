import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_bill/order_bill.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_items/order_item_list.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary(this.order, {super.key});

  final Transaction order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UIText.heading5('Order # ${order.receiptId}'),
            const UIHorizontalSpace(8),
          ],
        ),
        const UIVerticalSpace(2),
        UIText.bodyRegular('(${order.items?.length} items)', color: UIColors.textMuted),
        const UIVerticalSpace(20),
        Expanded(child: OrderItemList(order.items ?? [], isReadOnly: true)),
        const UIVerticalSpace(30),
        OrderBill(order: order, isReadOnly: true),
      ],
    );
  }
}
