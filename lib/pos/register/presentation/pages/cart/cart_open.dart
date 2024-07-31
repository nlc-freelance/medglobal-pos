import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/widgets/order_bill.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/widgets/cart_items/cart_items.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartOpen extends StatelessWidget {
  const CartOpen({super.key, this.isOrderPlaced = false});

  final bool isOrderPlaced;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      buildWhen: (previous, current) => previous.order.items?.length != current.order.items?.length,
      builder: (context, state) {
        final orderItems = state.order.items ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIText.heading5('Order ${isOrderPlaced ? 'Summary' : 'Details'}'),
                const UIHorizontalSpace(8),
                UIText.bodyRegular('(${orderItems.length} items)', color: UIColors.textMuted),
              ],
            ),
            if (orderItems.isNotEmpty == true) ...[
              const UIVerticalSpace(30),
              Expanded(child: CartItems(orderItems, isOrderPlaced: isOrderPlaced)),
              const UIVerticalSpace(46),
            ] else ...[
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    Assets.icons.cube.svg(),
                    const UIVerticalSpace(12),
                    UIText.labelMedium('No items added'),
                  ],
                ),
              ),
              const Spacer(),
            ],
            OrderBill(isOrderPlaced: isOrderPlaced),
            if (orderItems.isNotEmpty == true && !isOrderPlaced) ...[
              const UIVerticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: UIButton.filled(
                      'Cancel Order',
                      onClick: () => context.read<OrderCubit>().reset(),
                      style: UIStyleButton.filled.style?.copyWith(
                        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                        backgroundColor: UIStyleUtil.setColor(UIColors.whiteBg),
                        overlayColor: UIStyleUtil.setColor(UIColors.cancelled),
                        textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6),
                        foregroundColor: UIStyleUtil.setForegroundColorOnHover(UIColors.background),
                      ),
                    ),
                  ),
                  const UIHorizontalSpace(8),
                  Expanded(
                    flex: 2,
                    child: UIButton.filled(
                      'Place Order',
                      onClick: () => AppRouter.router.goNamed('Billing'),
                      style: UIStyleButton.filled.style?.copyWith(
                        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                        textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6.copyWith(color: UIColors.textRegular)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
