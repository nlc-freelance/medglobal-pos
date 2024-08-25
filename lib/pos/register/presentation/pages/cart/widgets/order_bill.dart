import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/horizontal_dashed_divider.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class OrderBill extends StatelessWidget {
  const OrderBill({super.key, this.isOrderPlaced = false});

  final bool isOrderPlaced;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listenWhen: (previous, current) => previous.order.hasChangedInSubtotalDiscountOrType(current.order),
      listener: (context, state) => context.read<OrderCubit>().computeTotal(),
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: UIColors.whiteBg,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.bodyRegular('Subtotal', color: UIColors.textLight),
                  UIText.bodyRegular('₱${(state.order.subtotal ?? 0).toStringAsFixed(2)}'),
                ],
              ),
              const UIVerticalSpace(8),

              /// TODO: No discount for the full bill for now, requested to be removed
              // OrderDiscount(isOrderPlaced: isOrderPlaced),
              // const UIVerticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.bodyRegular('Total Discount', color: UIColors.textLight),
                  UIText.bodyRegular('- ₱${(state.order.totalDiscountFromAllItems).toPesoString()}'),
                ],
              ),
              const UIVerticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.bodyRegular('Tax', color: UIColors.textLight),
                  UIText.bodyRegular('₱${(state.order.tax ?? 0).toStringAsFixed(2)}'),
                ],
              ),
              const UIVerticalSpace(20),
              const HorizontalDashedDivider(color: UIColors.borderRegular),
              const UIVerticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.heading5('Total'),
                  UIText.heading5('₱${(state.order.total ?? 0).toStringAsFixed(2)}'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
