import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/transaction_enum.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionTypeBadge extends StatelessWidget {
  final TransactionType type;

  const TransactionTypeBadge(this.type, {super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (type == TransactionType.sale
            ? UIColors.completedBg
            : UIColors.cancelledBg)
            .withValues(alpha: 0.4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          type == TransactionType.refund
              ? Assets.icons.import
              .svg(colorFilter: UIColors.error.toColorFilter)
              : Assets.icons.received
              .svg(colorFilter: UIColors.success.toColorFilter, width: 10),
          const UIHorizontalSpace(8),
          UIText.labelRegular(
            type.label,
            color: type == TransactionType.sale
                ? UIColors.success
                : UIColors.error,
          ),
        ],
      ),
    );
  }
}
