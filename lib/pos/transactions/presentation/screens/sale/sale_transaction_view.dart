import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_view_mode/transaction_view_mode_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/sale/sale_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/widgets/transaction_type_badge.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SaleTransactionView extends StatelessWidget {
  final Transaction transaction;

  const SaleTransactionView({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UIText.heading5('Sale Transaction'),
            const UIHorizontalSpace(4),
            TransactionTypeBadge(transaction.type),
            const Spacer(),
            UIButton.filled(
              'Print Receipt',
              isLoading: context.select<PrintReceiptCubit, bool>((state) => state is PrintReceiptLoading),
              onClick: () => context.read<PrintReceiptCubit>().generateAndPrintReceipt(transaction),
              style: UIStyleButton.filled.style?.copyWith(
                backgroundColor: UIStyleUtil.setColor(UIColors.whiteBg),
                overlayColor: UIStyleUtil.setColor(UIColors.borderMuted),
                textStyle: UIStyleUtil.setTextStyle(UIStyleText.labelSemiBold),
                foregroundColor: UIStyleUtil.setForegroundColorOnHover(UIColors.textRegular),
              ),
            ),
            const UIHorizontalSpace(8),
            UIButton.filled(
              'Issue Refund',
              onClick: () => context.read<TransactionViewModeCubit>().view(TransactionViewMode.issueRefund),
            ),
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
                UIText.heading6('Receipt ID'),
                UIText.bodyRegular(transaction.receiptId),
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
        SaleItemsDataGrid(transaction),
      ],
    );
  }
}
