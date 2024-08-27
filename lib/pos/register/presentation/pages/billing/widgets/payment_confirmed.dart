import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PaymentConfirmed extends StatelessWidget {
  const PaymentConfirmed({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.checkCircle.svg(width: 60, colorFilter: UIColors.success.toColorFilter),
          const UIVerticalSpace(30),
          UIText.heading2('Transaction Successful'),
          const UIVerticalSpace(60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIText.heading5('Receipt date'),
              UIText.heading5(DateFormat('yyyy/MM/dd HH:mm:ss').format(transaction.createdAt!)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIText.heading5('Receipt ID'),
              UIText.heading5('${transaction.receiptId}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIText.heading5('Total paid'),
              UIText.heading5('₱${transaction.total!.toStringAsFixed(2)}'),
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
                      backgroundColor: UIStyleUtil.setColor(UIColors.whiteBg),
                      overlayColor: UIStyleUtil.setColor(UIColors.borderMuted),
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
