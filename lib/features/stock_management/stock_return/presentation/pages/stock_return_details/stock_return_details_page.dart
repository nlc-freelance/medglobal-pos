import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/pages/stock_return_details/stepper/stock_return_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockReturnDetailsPage extends StatelessWidget {
  const StockReturnDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Edit Stock Return',
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
          ],
        ),

        /// If Status is 'New'
        UIText.heading5('Step 2 of 3 - Editing'),
        const UIVerticalSpace(12),
        const StockReturnStepper(currentStep: 1),

        /// If status is 'Completed'/'Cancelled'
        // const Expanded(
        //   child: SingleChildScrollView(
        //     child: PurchaseOrderDetails(),
        //   ),
        // )
      ],
    );
  }
}
