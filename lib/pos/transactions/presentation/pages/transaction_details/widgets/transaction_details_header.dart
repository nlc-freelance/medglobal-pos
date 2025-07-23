import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/receipt_config/receipt_config_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/pos_transaction_bloc/pos_transaction_bloc.dart';
// import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionDetailsHeader extends StatelessWidget {
  const TransactionDetailsHeader({
    required this.isIssuingRefund,
    required this.onTapReceiptId,
    required this.transaction,
    super.key,
  });

  final bool isIssuingRefund;
  final VoidCallback onTapReceiptId;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (transaction.type == TransactionType.sale)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: isIssuingRefund ? 4 : 0),
                child: UIText.heading5(isIssuingRefund ? 'Issue Refund' : 'Sale Transaction'),
              ),
              if (!isIssuingRefund) ...[
                const Spacer(),
                BlocConsumer<ReceiptConfigBloc, ReceiptConfigState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      loaded: (config) => context.read<PrintReceiptCubit>().generateAndPrintReceipt(
                            transaction: transaction,
                            receiptConfig: config,
                          ),
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return UIButton.filled(
                      'Print Receipt',
                      isLoading: state.maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ),
                      onClick: () => context
                          .read<ReceiptConfigBloc>()
                          .add(ReceiptConfigEvent.getReceiptConfigByBranchId(transaction.branch.id!)),
                      style: UIStyleButton.filled.style?.copyWith(
                        backgroundColor: UIStyleUtil.setColor(UIColors.whiteBg),
                        overlayColor: UIStyleUtil.setColor(UIColors.borderMuted),
                        textStyle: UIStyleUtil.setTextStyle(UIStyleText.labelSemiBold),
                        foregroundColor: UIStyleUtil.setForegroundColorOnHover(UIColors.textRegular),
                      ),
                    );
                  },
                ),
                const UIHorizontalSpace(8),
                UIButton.filled(
                  'Issue Refund',
                  onClick: onTapReceiptId,
                ),
              ],
            ],
          ),
        if (transaction.type == TransactionType.refund) UIText.heading5('Refund Transaction'),
        const UIVerticalSpace(30),
        Row(
          children: [
            if (transaction.type == TransactionType.refund) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Refund ID'),
                  UIText.bodyRegular(transaction.receiptId),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Refund from'),
                  HoverBuilder(
                    builder: (isHover) => InkWell(
                      onTap: () => context
                          .read<PosTransactionBloc>()
                          .add(PosTransactionEvent.getTransactionById(transaction.saleTransactionId!)),
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
              const Spacer(),
            ],
            if (transaction.type == TransactionType.sale && isIssuingRefund) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Refund for'),
                  HoverBuilder(
                    builder: (isHover) => InkWell(
                      onTap: onTapReceiptId,
                      hoverColor: UIColors.transparent,
                      child: Text(
                        transaction.receiptId,
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
              const Spacer(),
            ],
            if (transaction.type == TransactionType.sale && !isIssuingRefund) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Receipt ID'),
                  UIText.bodyRegular(transaction.receiptId),
                ],
              ),
              const Spacer(),
            ],
            if (!isIssuingRefund) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Date'),
                  UIText.bodyRegular(DateFormat('MM/dd/yyyy h:mm a').format(transaction.createdAt)),
                ],
              ),
              const Spacer(),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.heading6('Cashier'),
                UIText.bodyRegular(transaction.employee.name),
              ],
            ),
            const Spacer(flex: 4),
          ],
        ),
      ],
    );
  }
}
