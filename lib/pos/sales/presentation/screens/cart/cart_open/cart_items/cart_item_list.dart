import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/screens/cart/cart_open/cart_items/cart_item_actions.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/screens/cart/cart_open/cart_items/cart_item_tile.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartItemList extends StatefulWidget {
  const CartItemList({
    super.key,
    required this.items,
    required this.isCartItemEditable,
  });

  final List<OrderItem> items;
  final bool isCartItemEditable;

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  int _currentPanelIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      separatorBuilder: (_, __) => const UIVerticalSpace(0),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final itemId = widget.items[index].id;

        return Container(
          decoration: UIStyleContainer.bottomBorder(),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: UIColors.transparent,
              highlightColor: UIColors.transparent,
              hoverColor: UIColors.whiteBg,
            ),
            child: ListTileTheme(
              contentPadding: EdgeInsets.zero,
              dense: true,
              horizontalTitleGap: 0.0,
              minLeadingWidth: 0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              child: ExpansionTile(
                key: UniqueKey(),
                enabled: widget.isCartItemEditable,
                leading: const SizedBox(),
                controlAffinity: ListTileControlAffinity.leading,
                initiallyExpanded: index == _currentPanelIndex,
                tilePadding: const EdgeInsets.only(right: 8, top: 2),
                childrenPadding: const EdgeInsets.fromLTRB(68, 12, 12, 16),
                backgroundColor: UIColors.whiteBg.withValues(alpha: 0.8),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                onExpansionChanged: (bool expanded) => setState(() => _currentPanelIndex = expanded ? index : -1),
                title: CartItemTile(
                  itemId: itemId,
                  isCartItemEditable: widget.isCartItemEditable,
                ),
                children: [CartItemActions(itemId: itemId)],
              ),
            ),
          ),
        );
      },
    );
  }
}
