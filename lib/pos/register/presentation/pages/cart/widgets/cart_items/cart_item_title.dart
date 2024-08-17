import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order_item.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartItemTitle extends StatefulWidget {
  const CartItemTitle(this.item, {super.key, this.isOrderPlaced = false});

  final OrderItem item;
  final bool isOrderPlaced;

  @override
  State<CartItemTitle> createState() => _CartItemTitleState();
}

class _CartItemTitleState extends State<CartItemTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.isOrderPlaced) ...[
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 4.8),
            child: Assets.icons.arrowRight.svg(width: 12, colorFilter: UIColors.textMuted.toColorFilter),
          ),
          HoverBuilder(
            builder: (isHover) => Padding(
              padding: const EdgeInsets.only(top: 3.5, left: 12),
              child: InkWell(
                onTap: () => context.read<OrderCubit>().removeItem(widget.item.id!),
                child: Assets.icons.minusSquare.svg(
                  width: 16,
                  colorFilter: isHover ? UIColors.buttonDanger.toColorFilter : UIColors.textMuted.toColorFilter,
                ),
              ),
            ),
          ),
          const UIHorizontalSpace(18),
        ] else
          const UIHorizontalSpace(4),
        BlocBuilder<OrderCubit, OrderState>(
          /// Rebuild details of an order item when there's changes in quantity or discount
          buildWhen: (previous, current) {
            if (previous.order.items?.length == current.order.items?.length) {
              final prevItems = previous.order.items ?? [];
              final currItems = current.order.items ?? [];

              for (var prevItem in prevItems) {
                final currItem = currItems.firstWhere((item) => item.id == prevItem.id);
                if (prevItem.hasChangedInQtyDiscountOrTypePerItem(currItem)) {
                  return true;
                }
              }

              return false;
            }
            return false;
          },
          builder: (context, state) {
            final item = (state.order.items ?? []).singleWhere((item) => item.id == widget.item.id);

            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: UIText.label(item.name!),
                      ),
                      UIText.label('₱${item.totalPricePerItem.toStringAsFixed(2)}'),
                    ],
                  ),
                  const UIVerticalSpace(1),
                  Row(
                    children: [
                      Text('x ${item.qty.toString()}', style: UIStyleText.hintRegular),
                      const UIHorizontalSpace(16),
                      Text(
                        item.discount != null && item.discount != 0
                            ? '₱${item.discountedPrice?.toStringAsFixed(2)}'
                            : '₱${item.price?.toStringAsFixed(2)}',
                        style: UIStyleText.hintRegular,
                      ),
                      if (item.discount != null && item.discount != 0) ...[
                        const UIHorizontalSpace(12),
                        Text(
                          '₱${item.price?.toStringAsFixed(2)}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: UIColors.textMuted.withOpacity(0.6),
                            color: UIColors.textMuted.withOpacity(0.6),
                            fontSize: 13.2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const UIHorizontalSpace(12),
                        Container(
                          margin: const EdgeInsets.only(top: 0),
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0.3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: UIColors.cancelledBg.withOpacity(0.4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.icons.tag.svg(colorFilter: UIColors.buttonDanger.toColorFilter, width: 12),
                              const UIHorizontalSpace(4),
                              Text(
                                item.discountType == DiscountType.PESO
                                    ? '₱${item.discount} off'
                                    : '${item.discount}% off',
                                style: UIStyleText.hint.copyWith(color: UIColors.buttonDanger, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
