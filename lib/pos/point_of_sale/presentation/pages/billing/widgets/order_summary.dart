import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/horizontal_dashed_divider.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_bill/order_bill.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_items/order_item_list.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary(this.order, {super.key});

  // final Order order;
  final Transaction order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // UIText.heading5('Order # ${order.amountPaid}'),
            UIText.heading5('Order # ${order.receiptId}'),
            const UIHorizontalSpace(8),
          ],
        ),
        const UIVerticalSpace(2),
        UIText.bodyRegular('(${order.items?.length} items)', color: UIColors.textMuted),
        const UIVerticalSpace(20),
        // Expanded(child: OrderItemList(order.items ?? [], isReadOnly: true)),
        const UIVerticalSpace(30),
        // OrderBill(order: order, isReadOnly: true),
        ///
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: UIColors.whiteBg,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.bodyRegular('Subtotal', color: UIColors.textLight),
                  UIText.bodyRegular('₱${(order.subtotal)?.toPesoString()}'),
                ],
              ),
              const UIVerticalSpace(8),

              /// TODO: No discount for the full bill for now, requested to be removed
              // OrderDiscount(isReadOnly: isReadOnly),
              // const UIVerticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.bodyRegular('Total Discount', color: UIColors.textLight),
                  UIText.bodyRegular('- ₱${(order.totalDiscountAmount).toPesoString()}'),
                  // UIText.bodyRegular('- ₱${(order.totalDiscountInPeso).toPesoString()}'),
                ],
              ),
              const UIVerticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.bodyRegular('Tax', color: UIColors.textLight),
                  // UIText.bodyRegular('₱${(order.tax).toPesoString()}'),
                ],
              ),
              const UIVerticalSpace(20),
              const HorizontalDashedDivider(color: UIColors.borderRegular),
              const UIVerticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.heading5('Total'),
                  UIText.heading5('₱${(order.total).toPesoString()}'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
