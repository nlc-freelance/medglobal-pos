import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/purchase_order_details.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/new/new_purchase_order_form.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// Pass currentStep as 1 when calling this widget on DetailsPage to display correct title
class PurchaseOrderStepper extends StatefulWidget {
  const PurchaseOrderStepper({super.key, this.currentStep});

  final int? currentStep;

  @override
  State<PurchaseOrderStepper> createState() => _PurchaseOrderStepperState();
}

class _PurchaseOrderStepperState extends State<PurchaseOrderStepper> {
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
          stepIconBuilder: (index, state) {
            if (state == StepState.complete) {
              return Assets.icons.check.svg();
            } else {
              return UIText.labelMedium((index + 1).toString(), color: UIColors.background);
            }
          },
          connectorColor: WidgetStateColor.resolveWith((state) {
            if (state.contains(WidgetState.selected)) return UIColors.primary;
            return UIColors.borderMuted;
          }),
          controlsBuilder: (context, details) {
            final payload = context.select((NewPurchaseOrderCubit cubit) => cubit.state.payload);

            return BlocConsumer<PurchaseOrderRemoteCubit, PurchaseOrderRemoteState>(
              listener: (context, state) {
                if (state is PurchaseOrderCreateSuccess) {
                  final id = state.purchaseOrder.id;
                  AppRouter.router.goNamed(
                    SideMenuTreeItem.PURCHASE_ORDER_DETAILS.name,
                    pathParameters: {'id': id.toString()},
                  );
                }
                if (state is PurchaseOrderSuccess) {
                  context.read<PurchaseOrderCubit>().setPurchaseOrder(state.purchaseOrder);
                }
              },
              builder: (context, state) {
                return BlocBuilder<PurchaseOrderCubit, PurchaseOrderState>(
                  builder: (context, localState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state is PurchaseOrderError) ...[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.icons.infoCircle.svg(),
                              const UIHorizontalSpace(8),
                              UIText.labelSemiBold('Something went wrong. ${state.message}',
                                  color: UIColors.buttonDanger),
                            ],
                          ),
                          const UIVerticalSpace(16),
                        ],
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (_currentStep != 3)
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: UIButton.outlined(
                                  'Cancel',
                                  onClick: () =>
                                      AppRouter.router.pushReplacementNamed(SideMenuTreeItem.PURCHASE_ORDERS.name),
                                ),
                              ),
                            if (_currentStep == 0)
                              UIButton.filled(
                                'Create',
                                icon: Assets.icons.arrowRight1.setSize(12),
                                iconAlign: IconAlignment.end,
                                isLoading: state is PurchaseOrderCreateLoading,
                                onClick: () => context.read<PurchaseOrderRemoteCubit>().create(payload),
                              ),
                            if (localState.purchaseOrder.status == StockOrderStatus.NEW) ...[
                              UIButton.filled(
                                'Save',
                                isLoading: state is PurchaseOrderSaveLoading,
                                onClick: () => context.read<PurchaseOrderRemoteCubit>().update(
                                      StockOrderUpdate.SAVE,
                                      id: localState.purchaseOrder.id!,
                                      purchaseOrder: localState.purchaseOrder,
                                    ),
                              ),
                              const UIHorizontalSpace(8),
                              UIButton.filled(
                                'Save and Mark as Shipped',
                                icon: Assets.icons.arrowRight1.setSize(12),
                                iconAlign: IconAlignment.end,
                                isLoading: state is PurchaseOrderSaveAndMarkAsShippedLoading,
                                onClick: () {
                                  context.read<PurchaseOrderRemoteCubit>().update(
                                        /// If purchaseOrderItems has negative id (added locally)
                                        /// Pass SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS else SAVE_AND_MARK_AS_SHIPPED
                                        localState.purchaseOrder.items?.any((item) => item.id! < 0) == true
                                            ? StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS
                                            : StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED,
                                        id: localState.purchaseOrder.id!,
                                        purchaseOrder: localState.purchaseOrder,
                                      );
                                },
                              ),
                            ] else if (localState.purchaseOrder.status == StockOrderStatus.FOR_RECEIVING)
                              UIButton.filled(
                                'Save and Received',
                                icon: Assets.icons.arrowRight1.setSize(12),
                                iconAlign: IconAlignment.end,
                                isLoading: state is PurchaseOrderSaveAndReceivedLoading,
                                onClick: () {
                                  context.read<PurchaseOrderRemoteCubit>().update(
                                        StockOrderUpdate.SAVE_AND_RECEIVED,
                                        id: localState.purchaseOrder.id!,
                                        purchaseOrder: localState.purchaseOrder,
                                      );
                                },
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          steps: [
            Step(
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
              title: const Text('Create'),
              content: _currentStep == 0
                  ? Theme(data: Theme.of(context), child: const NewPurchaseOrderForm())
                  : const SizedBox(),
            ),
            Step(
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
              title: const Text('Edit'),
              content: const PurchaseOrderDetails(),
            ),
            Step(
              isActive: _currentStep >= 2,
              state: _currentStep > 2 ? StepState.complete : StepState.indexed,
              title: const Text('Receive'),
              content: const PurchaseOrderDetails(),
            ),
            Step(
              isActive: _currentStep >= 3,
              state: _currentStep >= 3 ? StepState.complete : StepState.indexed,
              title: const Text('Complete'),
              content: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
