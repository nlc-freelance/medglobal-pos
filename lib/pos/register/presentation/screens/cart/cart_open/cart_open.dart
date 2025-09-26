import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/cart/cart_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/sale/sale_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/cart/cart_open/cart_items/cart_item_list.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/cart/cart_open/cart_summary.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartOpen extends StatelessWidget {
  const CartOpen({
    super.key,
    this.isCartEditable = true,
    this.isOrderCompleted = false,
  });

  final bool isOrderCompleted;
  final bool isCartEditable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final orderItems = state.order.items;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIText.heading5(isOrderCompleted ? 'Order Completed' : 'Order Summary'),
                const UIHorizontalSpace(8),
                UIText.bodyRegular('(${orderItems.length} items)', color: UIColors.textMuted),
              ],
            ),
            if (orderItems.isNotEmpty == true) ...[
              const UIVerticalSpace(24),
              Expanded(
                child: CartItemList(
                  items: orderItems,
                  isCartItemEditable: isCartEditable,
                ),
              ),
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
            CartSummary(order: state.order),
            if (isCartEditable && orderItems.isNotEmpty) ...[
              const UIVerticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: UIButton.filled(
                      'Cancel Order',
                      onClick: () => context.read<CartBloc>().add(const CartEvent.reset()),
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
                      onClick: () {
                        context.goNamed('paymentScreen');
                        context.read<SaleBloc>().add(const SaleEvent.reset());
                      },
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
