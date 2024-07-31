import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PaymentConfirmed extends StatelessWidget {
  const PaymentConfirmed(this.transaction, {super.key});

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
          UIText.heading1('Transaction Successful'),
          const UIVerticalSpace(60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIText.heading6('TRANSACTION ID', color: UIColors.textMuted),
              UIText.heading5('${transaction.id}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIText.heading6('AMOUNT PAID', color: UIColors.textMuted),
              UIText.heading5('₱${transaction.total!.toStringAsFixed(2)}'),
            ],
          ),
          const UIVerticalSpace(80),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: UIButton.filled(
                  'Print Receipt',
                  onClick: () {},
                  style: UIStyleButton.filled.style?.copyWith(
                    minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                    backgroundColor: UIStyleUtil.setColor(UIColors.whiteBg),
                    overlayColor: UIStyleUtil.setColor(UIColors.borderMuted),
                    textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6),
                    foregroundColor: UIStyleUtil.setForegroundColorOnHover(UIColors.textRegular),
                  ),
                ),
              ),
              const UIHorizontalSpace(16),
              Expanded(
                child: UIButton.filled(
                  'New Sale',
                  onClick: () {
                    context.read<OrderCubit>().reset();
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
