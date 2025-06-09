import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_items/order_item/edit_item.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_items/order_item/item_title.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class OrderItemList extends StatefulWidget {
  const OrderItemList(this.items, {super.key, this.isReadOnly = false});

  final List<TransactionItem> items;
  final bool isReadOnly;

  @override
  State<OrderItemList> createState() => _OrderItemListState();
}

class _OrderItemListState extends State<OrderItemList> {
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
                enabled: widget.isReadOnly != true,
                leading: const SizedBox(),
                controlAffinity: ListTileControlAffinity.leading,
                initiallyExpanded: index == _currentPanelIndex,
                tilePadding: const EdgeInsets.only(right: 8, top: 2),
                childrenPadding: const EdgeInsets.fromLTRB(68, 12, 12, 16),
                backgroundColor: UIColors.whiteBg.withOpacity(0.8),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                onExpansionChanged: (bool expanded) => setState(() => _currentPanelIndex = expanded ? index : -1),
                title: ItemTitle(item, isReadOnly: widget.isReadOnly),
                children: [EditItem(item)],
              ),
            ),
          ),
        );
      },
    );
  }
}
