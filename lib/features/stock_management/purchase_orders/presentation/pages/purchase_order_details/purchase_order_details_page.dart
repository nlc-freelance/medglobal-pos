import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/purchase_order_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderDetailsPage extends StatelessWidget {
  const PurchaseOrderDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          /// if status == 'new' -> 'Edit Purchase Order, 'for receiving' -> Receive Purchase Order, 'completed' -> Purchase Order Details
          title: 'Edit Purchase Order',
          subtitle: Strings.subtitlePlaceholder,
          titleTrailings: [
            // if (status == 'completed')
            // Chip(
            //   label: Text(
            //     'Completed',
            //     style: UIStyleText.chip.copyWith(color: UIColors.completed),
            //   ),
            //   backgroundColor: UIColors.completedBg,
            //   padding: const EdgeInsets.symmetric(horizontal: 8),
            //   visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     side: const BorderSide(color: UIColors.transparent),
            //   ),
            // ),
            // const UIHorizontalSpace(12),
            UIPopupMenuButton.icon(
              onSelect: (menu) {},
              icon: Assets.icons.more.setSize(20),
              menu: const ['Cancel Purchase Order', 'Delete Purchase Order'],
              menuAsString: (menu) => menu,
            ),
          ],
        ),

        /// If Status is 'New' -> 'Step 2 of 4 - Editing', if 'For Receiving' -> 'Step 3 of 4 - Receiving'
        UIText.heading5('Step 2 of 4 - Editing'),
        const UIVerticalSpace(12),

        /// If status is 'New' pass 1, 2 if 'For Receiving', 3 if 'Completed'/'Cancelled'
        const PurchaseOrderStepper(currentStep: 1),

        /// If status is 'Completed'/'Cancelled'
        // const Expanded(
        //   child: SingleChildScrollView(
        //     child: PurchaseOrderDetails(StockActionStatus.COMPLETED),
        //   ),
        // )
      ],
    );
  }
}
