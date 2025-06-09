import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({required this.item, super.key});

  final TransactionItem item;

  @override
  Widget build(BuildContext context) {
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
              UIText.label('₱${item.total.toPesoString()}'),
            ],
          ),
          const UIVerticalSpace(1),
          Row(
            children: [
              Text('x ${item.qty.toString()}', style: UIStyleText.hintRegular),
              const UIHorizontalSpace(16),
              Text(
                '₱${(item.discountedPrice ?? item.price).toPesoString()}',
                style: UIStyleText.hintRegular,
              ),
              if (item.discount != null) ...[
                if (item.discountedPrice != null) ...[
                  const UIHorizontalSpace(12),
                  Text(
                    '₱${item.price?.toPesoString()}',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: UIColors.textMuted.withOpacity(0.6),
                      color: UIColors.textMuted.withOpacity(0.6),
                      fontSize: 13.2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
                const UIHorizontalSpace(12),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
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
                        item.discountType == DiscountType.PESO ? '₱${item.discount} off' : '${item.discount}% off',
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
  }
}
