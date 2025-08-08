import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/screens/cart/cart_open/cart_items/cart_item_details.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartItemTile extends StatefulWidget {
  const CartItemTile({
    required this.itemId,
    required this.isCartItemEditable,
    super.key,
  });

  final int itemId;
  final bool isCartItemEditable;

  @override
  State<CartItemTile> createState() => _CartItemListTileState();
}

class _CartItemListTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {
    final item = context.read<CartBloc>().state.order.items.firstWhereOrNull((item) => item.id == widget.itemId);

    if (item == null) return const SizedBox.shrink();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isCartItemEditable) ...[
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 4.8),
            child: Assets.icons.arrowRight.svg(width: 12, colorFilter: UIColors.textMuted.toColorFilter),
          ),
          HoverBuilder(
            builder: (isHover) => Padding(
              padding: const EdgeInsets.only(top: 3.5, left: 12),
              child: InkWell(
                onTap: () => context.read<CartBloc>().add(CartEvent.removeItem(item.id)),
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
        CartItemDetails(id: item.id),
      ],
    );
  }
}
