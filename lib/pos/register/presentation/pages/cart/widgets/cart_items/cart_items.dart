import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order_item.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/widgets/cart_items/cart_item_details.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/widgets/cart_items/cart_item_title.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartItems extends StatefulWidget {
  const CartItems(this.items, {super.key, this.isOrderPlaced = false});

  final List<OrderItem> items;
  final bool isOrderPlaced;

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  int _currentPanelIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      separatorBuilder: (_, __) => const UIVerticalSpace(0),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];

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
                enabled: widget.isOrderPlaced != true,
                leading: const SizedBox(),
                controlAffinity: ListTileControlAffinity.leading,
                initiallyExpanded: index == _currentPanelIndex,
                tilePadding: const EdgeInsets.only(right: 8, top: 2),
                childrenPadding: const EdgeInsets.fromLTRB(68, 12, 12, 16),
                backgroundColor: UIColors.whiteBg.withOpacity(0.8),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                onExpansionChanged: (bool expanded) => setState(() => _currentPanelIndex = expanded ? index : -1),
                title: CartItemTitle(item, isOrderPlaced: widget.isOrderPlaced),
                children: [CartItemDetails(item)],
              ),
            ),
          ),
        );
      },
    );
  }
}
