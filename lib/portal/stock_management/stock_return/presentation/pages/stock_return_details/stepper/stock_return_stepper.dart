import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/new_stock_return/new_stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_remote/stock_return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/details/stock_return_details.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/new/new_stock_return_form.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// Pass currentStep as 1 when calling this widget on DetailsPage to display correct title
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
            final payload = context.select((NewStockReturnCubit cubit) => cubit.state.payload);
            final stockReturn = context.select((StockReturnCubit cubit) => cubit.state.stockReturn);

            return BlocConsumer<StockReturnRemoteCubit, StockReturnRemoteState>(
              listener: (context, state) {
                if (state is StockReturnCreateSuccess) {
                  final id = state.stockReturn.id;
                  // AppRouter.router.goNamed(
                  //   SideMenuTreeItem.STOCK_RETURN_DETAILS.name,
                  //   pathParameters: {'id': id.toString()},
                  // );
                  context.goNamed(
                    'stockReturnDetails',
                    pathParameters: {'id': id.toString()},
                  );
                }
                if (state is StockReturnSuccess) {
                  context.read<StockReturnCubit>().setStockReturn(state.stockReturn);
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is StockReturnError) ...[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.icons.infoCircle.svg(),
                          const UIHorizontalSpace(8),
                          UIText.labelSemiBold('Something went wrong. ${state.message}', color: UIColors.buttonDanger),
                        ],
                      ),
                      const UIVerticalSpace(16),
                    ],
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (_currentStep != 2)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: UIButton.outlined(
                              'Cancel',
                              onClick: () => context.goNamed('stockReturnList'),
                              // onClick: () => AppRouter.router.pushReplacementNamed(SideMenuTreeItem.STOCK_RETURNS.name),
                            ),
                          ),
                        if (_currentStep == 0)
                          UIButton.filled(
                            'Create',
                            icon: Assets.icons.arrowRight1.setSize(12),
                            iconAlign: IconAlignment.end,
                            isLoading: state is StockReturnCreateLoading,
                            onClick: () => context.read<StockReturnRemoteCubit>().create(payload),
                          ),
                        if (_currentStep == 1) ...[
                          UIButton.filled(
                            'Save',
                            isLoading: state is StockReturnSaveLoading,
                            onClick: () => context.read<StockReturnRemoteCubit>().update(
                                  StockOrderUpdate.SAVE,
                                  id: stockReturn.id!,
                                  stockReturn: stockReturn,
                                ),
                          ),
                          const UIHorizontalSpace(8),

                          /// When will a stock return be tagged as Completed?
                          UIButton.filled(
                            'Save and Mark as Shipped',
                            isLoading: state is StockReturnSaveAndMarkAsShippedLoading,
                            icon: Assets.icons.arrowRight1.setSize(12),
                            iconAlign: IconAlignment.end,
                            onClick: () {
                              context.read<StockReturnRemoteCubit>().update(
                                    /// If stockReturnItems has negative id (added locally)
                                    /// Pass SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS else SAVE_AND_MARK_AS_SHIPPED
                                    stockReturn.items?.any((item) => item.id! < 0) == true
                                        ? StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS
                                        : StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED,
                                    id: stockReturn.id!,
                                    stockReturn: stockReturn,
                                  );
                            },
                          ),
                        ]
                      ],
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
              content: _currentStep == 0
                  ? Theme(data: Theme.of(context), child: const NewStockReturnForm())
                  : const SizedBox(),
            ),
            Step(
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
              title: const Text('Edit'),
              content: const StockReturnDetails(),
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
