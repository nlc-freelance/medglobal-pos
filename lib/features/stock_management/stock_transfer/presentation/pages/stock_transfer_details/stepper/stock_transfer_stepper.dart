import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/details/stock_transfer_details.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/new/new_stock_transfer_form.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// Pass currentStep as 1 when calling this widget on DetailsPage to increment the step on continue
class StockTransferStepper extends StatefulWidget {
  const StockTransferStepper({super.key, this.currentStep});

  final int? currentStep;

  @override
  State<StockTransferStepper> createState() => _StockTransferStepperState();
}

class _StockTransferStepperState extends State<StockTransferStepper> {
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
            final payload = context.select((NewStockTransferCubit cubit) => cubit.state.payload);
            final stockTransfer = context.select((StockTransferCubit cubit) => cubit.state.stockTransfer);

            return BlocConsumer<StockTransferRemoteCubit, StockTransferRemoteState>(
              listener: (context, state) {
                if (state is StockTransferCreateSuccess) {
                  final id = state.stockTransfer.id;
                  AppRouter.router.goNamed(
                    SideMenuTreeItem.PURCHASE_ORDER_DETAILS.name,
                    pathParameters: {'id': id.toString()},
                  );
                }
                if (state is StockTransferError) {
                  ToastNotification.error(context, state.message);
                }
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_currentStep != 3)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: UIButton.outlined(
                          'Cancel',
                          onClick: () => AppRouter.router.pushReplacementNamed(SideMenuTreeItem.STOCK_TRANSFERS.name),
                        ),
                      ),
                    if (_currentStep == 0)
                      UIButton.filled(
                        'Create',
                        icon: Assets.icons.arrowRight.setSize(12),
                        iconAlign: IconAlignment.end,
                        isLoading: state is StockTransferCreateLoading,
                        onClick: () => context.read<StockTransferRemoteCubit>().create(payload),
                      ),
                    if (_currentStep == 1) ...[
                      UIButton.filled(
                        'Save',
                        isLoading: state is StockTransferSaveLoading,
                        onClick: () => context.read<StockTransferRemoteCubit>().update(
                              StockOrderUpdate.SAVE,
                              id: stockTransfer.id!,
                              stockTransfer: stockTransfer,
                            ),
                      ),
                      const UIHorizontalSpace(8),
                      UIButton.filled(
                        'Save and Mark as Shipped',
                        icon: Assets.icons.arrowRight.setSize(12),
                        iconAlign: IconAlignment.end,
                        isLoading: state is StockTransferSaveAndMarkAsShippedLoading,
                        onClick: () {
                          context.read<StockTransferRemoteCubit>().update(
                                /// If stockTransferItems has negative id (added locally)
                                /// Pass SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS else SAVE_AND_MARK_AS_SHIPPED
                                stockTransfer.items?.any((item) => item.id! < 0) == true
                                    ? StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS
                                    : StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED,
                                id: stockTransfer.id!,
                                stockTransfer: stockTransfer,
                              );
                        },
                      ),
                    ] else if (_currentStep == 2)
                      UIButton.filled(
                        'Mark Received',
                        icon: Assets.icons.arrowRight.setSize(12),
                        iconAlign: IconAlignment.end,
                        isLoading: state is StockTransferSaveAndReceivedLoading,
                        onClick: () {
                          context.read<StockTransferRemoteCubit>().update(
                                StockOrderUpdate.SAVE_AND_RECEIVED,
                                id: stockTransfer.id!,
                                stockTransfer: stockTransfer,
                              );
                        },
                      ),
                  ],
                );
              },
            );
          },
          steps: [
            Step(
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
              title: const Text('Create'),
              content: Theme(data: Theme.of(context), child: const NewStockTransferForm()),
            ),
            Step(
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
              title: const Text('Edit'),
              content: const StockTransferDetails(),
            ),
            Step(
              isActive: _currentStep >= 2,
              state: _currentStep > 2 ? StepState.complete : StepState.indexed,
              title: const Text('Shipped'),
              content: const StockTransferDetails(),
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
