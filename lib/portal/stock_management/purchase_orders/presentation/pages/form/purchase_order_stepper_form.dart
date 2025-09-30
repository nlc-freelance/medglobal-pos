import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/widgets/purchase_order_form_header.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/steps/purchase_order_form.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/steps/purchase_order_create_form.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/widgets/purchase_order_actions.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderStepperForm extends StatefulWidget {
  const PurchaseOrderStepperForm({super.key, required this.currentStep});

  final int currentStep;

  @override
  State<PurchaseOrderStepperForm> createState() => _PurchaseOrderStepperFormState();
}

class _PurchaseOrderStepperFormState extends State<PurchaseOrderStepperForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PurchaseOrderFormHeader(),
        Flexible(
          child: SizedBox(
            height: widget.currentStep == 0 ? 300 : null,
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: UIColors.background,
                hoverColor: UIColors.transparent,
                highlightColor: UIColors.transparent,
              ),
              child: Stepper(
                currentStep: widget.currentStep,
                type: StepperType.horizontal,
                elevation: 0,
                stepIconBuilder: (stepIndex, stepState) => stepState == StepState.complete
                    ? Assets.icons.check.svg()
                    : UIText.labelMedium(
                        (stepIndex + 1).toString(),
                        color: stepIndex == widget.currentStep ? UIColors.background : UIColors.textMuted,
                      ),
                connectorColor: WidgetStateColor.resolveWith((state) {
                  if (state.contains(WidgetState.selected)) return UIColors.primary;
                  return UIColors.borderMuted;
                }),
                steps: [
                  Step(
                    isActive: _stepIsActive(0),
                    state: _stepState(0),
                    title: _stepTitle('Create', _stepIsActive(0)),
                    content: Theme(data: Theme.of(context), child: const PurchaseOrderCreateForm()),
                  ),
                  Step(
                    isActive: _stepIsActive(1),
                    state: _stepState(1),
                    title: _stepTitle('Edit', _stepIsActive(1)),
                    content: const PurchaseOrderForm(),
                  ),
                  Step(
                    isActive: _stepIsActive(2),
                    state: _stepState(2),
                    title: _stepTitle('Receive', _stepIsActive(2)),
                    content: const PurchaseOrderForm(),
                  ),
                  Step(
                    isActive: _stepIsActive(3),
                    state: widget.currentStep >= 3 ? StepState.complete : StepState.indexed,
                    title: _stepTitle('Completed', _stepIsActive(3)),
                    content: const PurchaseOrderForm(),
                  ),
                ],
                controlsBuilder: (_, __) => const SizedBox.shrink(),
              ),
            ),
          ),
        ),
        const UIVerticalSpace(30),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
            builder: (context, state) => state.maybeWhen(
              failure: (message) => PageErrorBanner(message: message),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        ),
        PurchaseOrderActions(currentStep: widget.currentStep),
        const UIVerticalSpace(16),
      ],
    );
  }

  bool _stepIsActive(int step) {
    return widget.currentStep >= step;
  }

  StepState _stepState(int step) {
    return widget.currentStep > step ? StepState.complete : StepState.indexed;
  }

  Widget _stepTitle(String title, bool isActive) {
    return UIText.bodyRegular(
      title,
      color: isActive ? UIColors.textRegular : UIColors.textMuted,
    );
  }
}
