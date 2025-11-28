import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/register_transaction_bloc/register_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/refund/refunded_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/widgets/transaction_type_badge.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RefundTransactionView extends StatelessWidget {
  final Transaction transaction;

  const RefundTransactionView({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            UIText.heading5('Refund Transaction'),
            const UIHorizontalSpace(4),
            TransactionTypeBadge(transaction.type),
          ],
        ),
        const UIVerticalSpace(30),
        Wrap(
          spacing: 32,
          runSpacing: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.heading6('Refund ID'),
                UIText.bodyRegular(transaction.receiptId),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.heading6('Refund from'),
                HoverBuilder(
                  builder: (isHover) => InkWell(
                    onTap: () => context
                        .read<RegisterTransactionBloc>()
                        .add(RegisterTransactionEvent.getById(transaction.saleTransactionId!)),
                    hoverColor: UIColors.transparent,
                    child: Text(
                      transaction.saleTransactionReceiptId!,
                      style: UIStyleText.bodyRegular.copyWith(
                        color: UIColors.primary,
                        fontWeight: FontWeight.w400,
                        decoration: isHover ? TextDecoration.underline : TextDecoration.none,
                        decorationColor: UIColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.heading6('Date'),
                UIText.bodyRegular(transaction.createdAt.toFormattedDateTime12Hr()),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.heading6('Cashier'),
                UIText.bodyRegular(transaction.employee.name),
              ],
            ),
          ],
        ),
        const UIVerticalSpace(30),
        RefundedItemsDataGrid(transaction),
      ],
    );
  }
}
