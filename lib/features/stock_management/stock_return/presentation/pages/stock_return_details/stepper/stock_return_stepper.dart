import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/new/new_purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/purchase_order_details.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/pages/stock_return_details/stepper/details/stock_return_details.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/pages/stock_return_details/stepper/new/new_stock_return.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// Pass currentStep as 1 when calling this widget on DetailsPage to increment the step on continue
class StockReturnStepper extends StatefulWidget {
  const StockReturnStepper({super.key, this.currentStep});

  final int? currentStep;

  @override
  State<StockReturnStepper> createState() => _StockReturnStepperState();
}

class _StockReturnStepperState extends State<StockReturnStepper> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    if (widget.currentStep != null) _currentStep = widget.currentStep!;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: UIColors.background,
          hoverColor: UIColors.transparent,
          highlightColor: UIColors.transparent,
        ),
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          elevation: 0,
          connectorColor: WidgetStateColor.resolveWith((state) {
            if (state.contains(WidgetState.selected)) return UIColors.primary;
            return UIColors.borderMuted;
          }),
          controlsBuilder: (context, details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_currentStep != 2)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: UIButton.outlined(
                      'Cancel',
                      onClick: () => AppRouter.router.pop(),
                    ),
                  ),
                if (_currentStep == 0)
                  UIButton.filled(
                    'Create',
                    icon: Assets.icons.arrowRight.setSize(12),
                    iconAlign: IconAlignment.end,
                    onClick: () {
                      // CREATE request for Purchase Order
                      AppRouter.router.goNamed(SideMenuTreeItem.STOCK_RETURN_DETAILS.name, pathParameters: {'id': '1'});
                      // Use a bloc listener to that and when success, get the ID and go to route PurchaseOrderDetails
                    },
                  ),
                if (_currentStep == 1) ...[
                  UIButton.filled(
                    'Save',
                    onClick: () {
                      /// Status -> NEW
                    },
                  ),
                  const UIHorizontalSpace(8),

                  /// When will a stock return be tagged as Completed?
                  UIButton.filled(
                    'Save and Mark as Shipped',
                    icon: Assets.icons.arrowRight.setSize(12),
                    iconAlign: IconAlignment.end,
                    onClick: () {
                      /// Status -> SHIPPED
                      setState(() => _currentStep = 2);
                    },
                  ),
                ]
              ],
            );
          },
          steps: [
            Step(
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
              title: const Text('Create'),
              content: const NewStockReturn(),
            ),
            Step(
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
              title: const Text('Edit'),
              content: const StockReturnDetails(StockActionStatus.NEW),
            ),
            Step(
              isActive: _currentStep >= 2,
              state: _currentStep > 2 ? StepState.complete : StepState.indexed,
              title: const Text('Complete'),
              content: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
