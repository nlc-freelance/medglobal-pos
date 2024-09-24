import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PaymentConfirmed extends StatelessWidget {
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
              color: UIColors.success.withOpacity(0.08),
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
                  UIText.labelSemiBold('${transaction.receiptId}'),
                ],
              ),
              const UIVerticalSpace(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.labelMedium('Transaction Date', color: UIColors.textMuted),
                  UIText.labelSemiBold(DateFormat('MM-dd-yyyy HH:mm').format(transaction.createdAt!.toLocal())),
                ],
              ),
            ],
          ),
          const UIVerticalSpace(80),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: BlocListener<PrintReceiptCubit, PrintReceiptState>(
                  listener: (context, state) {
                    if (state is PrintReceiptSuccess) {
                      ToastNotification.success(
                        context,
                        'Receipt successfully generated.',
                        duration: 5000,
                      );
                    }
                    if (state is PrintReceiptError) ToastNotification.error(context, state.message);
                  },
                  child: UIButton.filled(
                    'Print Receipt',
                    onClick: () => context.read<PrintReceiptCubit>().generateAndPrintReceipt(transaction),
                    style: UIStyleButton.filled.style?.copyWith(
                      minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                      backgroundColor: UIStyleUtil.setColor(UIColors.borderMuted.withOpacity(0.9)),
                      overlayColor: UIStyleUtil.setColor(UIColors.borderRegular),
                      textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6),
                      foregroundColor: UIStyleUtil.setForegroundColorOnHover(UIColors.textRegular),
                    ),
                  ),
                ),
              ),
              const UIHorizontalSpace(16),
              Expanded(
                child: UIButton.filled(
                  'New Sale',
                  onClick: () {
                    context.read<SaleRemoteCubit>().reset();
                    AppRouter.router.goNamed('Register');
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
