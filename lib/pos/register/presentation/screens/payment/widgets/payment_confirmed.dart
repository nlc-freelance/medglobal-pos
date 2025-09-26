import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/sale/sale_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PaymentConfirmed extends StatelessWidget with DialogMixin {
  const PaymentConfirmed({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.35,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: UIColors.background,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: UIColors.success.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Assets.icons.checkCircle.svg(width: 30, colorFilter: UIColors.success.toColorFilter),
          ),
          const UIVerticalSpace(10),
          Text(
            'Transaction Successful!',
            style: UIStyleText.heading6.copyWith(fontWeight: FontWeight.w700),
          ),
          const UIVerticalSpace(40),
          Column(
            children: [
              UIText.labelSemiBold('CHANGE', color: UIColors.textGray),
              Text(
                '₱${(transaction.amountPaid! - transaction.total!).toPesoString()}',
                style: UIStyleText.heading1.copyWith(fontSize: 64),
              ),
            ],
          ),
          const UIVerticalSpace(30),
          const Divider(color: UIColors.borderMuted),
          const UIVerticalSpace(16),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.labelMedium('Total Paid', color: UIColors.textMuted),
                  UIText.heading6('₱${transaction.total!.toStringAsFixed(2)}'),
                ],
              ),
              const UIVerticalSpace(16),
              const Divider(color: UIColors.borderMuted),
              const UIVerticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.labelMedium('Transaction ID', color: UIColors.textMuted),
                  UIText.labelSemiBold(transaction.receiptId),
                ],
              ),
              const UIVerticalSpace(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.labelMedium('Transaction Date', color: UIColors.textMuted),
                  UIText.labelSemiBold(DateFormat('MM-dd-yyyy HH:mm').format(transaction.createdAt)),
                ],
              ),
            ],
          ),
          const UIVerticalSpace(80),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: FilledButton.icon(
                  label: const Text('Print Receipt'),
                  style: UIStyleButton.filled.style?.copyWith(
                    minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                    backgroundColor: UIStyleUtil.setColor(UIColors.borderMuted.withValues(alpha: 0.9)),
                    overlayColor: UIStyleUtil.setColor(UIColors.borderRegular),
                    textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6),
                    foregroundColor: UIStyleUtil.setForegroundColorOnHover(UIColors.textRegular),
                  ),
                  onPressed: () {
                    context.read<PrintReceiptCubit>().generateAndPrintReceipt(transaction);
                  },
                ),
              ),
              const UIHorizontalSpace(16),
              Expanded(
                child: UIButton.filled(
                  'New Sale',
                  onClick: () {
                    context.read<SaleBloc>().add(const SaleEvent.reset());
                    context.goNamed('registerScreen');
                  },
                  style: UIStyleButton.filled.style?.copyWith(
                    minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                    textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6.copyWith(color: UIColors.textRegular)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
