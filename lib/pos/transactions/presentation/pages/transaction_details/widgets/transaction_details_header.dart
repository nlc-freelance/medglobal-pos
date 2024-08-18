import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/cubit/transaction_cubit.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';
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
        if (transaction.type == TransactionType.SALE)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: isIssuingRefund ? 4 : 0),
                child: UIText.heading5(isIssuingRefund ? 'Issue Refund' : 'Sale Transaction'),
              ),
              if (!isIssuingRefund) ...[
                UIButton.filled(
                  'Issue Refund',
                  onClick: onTapReceiptId,
                ),
              ],
            ],
          ),
        if (transaction.type == TransactionType.REFUND) UIText.heading5('Refund Transaction'),
        const UIVerticalSpace(30),
        Row(
          children: [
            if (transaction.type == TransactionType.REFUND) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Refund ID'),
                  UIText.bodyRegular(transaction.receiptId!),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Refund from'),
                  HoverBuilder(
                    builder: (isHover) => InkWell(
                      onTap: () => context.read<TransactionCubit>().getTransactionById(transaction.saleTransactionId!),
                      hoverColor: UIColors.transparent,
                      child: Text(
                        /// This should be the MG-LP202400012 or the receipt id
                        /// A return transaction should also display the receipt id of the original sale,
                        /// not just the database id
                        transaction.saleTransactionId.toString(),
                        style: UIStyleText.bodyRegular.copyWith(
                          color: UIColors.primary,
                          fontSize: 16,
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
            if (transaction.type == TransactionType.SALE && isIssuingRefund) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Refund for'),
                  HoverBuilder(
                    builder: (isHover) => InkWell(
                      onTap: onTapReceiptId,
                      hoverColor: UIColors.transparent,
                      child: Text(
                        transaction.receiptId!,
                        style: UIStyleText.bodyRegular.copyWith(
                          color: UIColors.primary,
                          fontSize: 16,
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
            if (transaction.type == TransactionType.SALE && !isIssuingRefund) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Receipt ID'),
                  UIText.bodyRegular(transaction.receiptId!),
                ],
              ),
              const Spacer(),
            ],
            if (!isIssuingRefund) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Date'),
                  UIText.bodyRegular(DateFormat('MM/dd/yyyy h:mm a').format(transaction.createdAt!.toLocal())),
                ],
              ),
              const Spacer(),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.heading6('Cashier'),
                UIText.bodyRegular(transaction.employee!.name),
              ],
            ),
            const Spacer(flex: 4),
          ],
        ),
      ],
    );
  }
}
