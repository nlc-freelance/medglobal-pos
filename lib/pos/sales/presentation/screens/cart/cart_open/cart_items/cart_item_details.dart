import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order_item.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final item = state.order.items.firstWhereOrNull((item) => item.id == id);

        if (item == null) return const SizedBox.shrink();

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
                    child: UIText.label(item.itemName),
                  ),
                  UIText.label('₱${item.totalPrice.toPesoString()}'),
                ],
              ),
              const UIVerticalSpace(1),
              Row(
                children: [
                  Text('x ${item.quantity.toString()}', style: UIStyleText.hintRegular),
                  const UIHorizontalSpace(16),
                  Text(
                    '₱${(item.hasDiscountApplied ? item.discountedUnitPrice : item.price).toPesoString()}',
                    style: UIStyleText.hintRegular,
                  ),
                  if (item.discount != null) ...[
                    const UIHorizontalSpace(12),
                    Text(
                      '₱${item.price.toPesoString()}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: UIColors.textMuted.withValues(alpha: 0.6),
                        color: UIColors.textMuted.withValues(alpha: 0.6),
                        fontSize: 13.2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const UIHorizontalSpace(12),
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: UIColors.cancelledBg.withValues(alpha: 0.4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.icons.tag.svg(colorFilter: UIColors.buttonDanger.toColorFilter, width: 12),
                          const UIHorizontalSpace(4),
                          Text(
                            item.discountType == DiscountType.peso
                                ? '₱${item.discount!.value} off'
                                : '${item.discount!.value}% off',
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
    );
  }
}
