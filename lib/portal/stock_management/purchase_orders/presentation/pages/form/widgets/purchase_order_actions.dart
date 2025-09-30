import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/purchase_order_enum.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order_form/new_purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/widgets/undelivered_items_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderActions extends StatelessWidget {
  const PurchaseOrderActions({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderFormCubit, PurchaseOrderFormState>(
      builder: (context, state) {
        final po = state.purchaseOrder;

        return currentStep >= 3
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UIButton.outlined(
                      'Cancel',
                      onClick: () => context.goNamed('purchaseOrderList'),
                    ),
                    const UIHorizontalSpace(8),
                    if (currentStep == 0)
                      UIButton.filled(
                        'Create',
                        icon: Assets.icons.arrowRight1.setSize(12),
                        iconAlign: IconAlignment.end,
                        onClick: () {
                          final newPurchaseOrder = context.read<NewPurchaseOrderFormCubit>().state.newPurchaseOrder;
                          context
                              .read<PurchaseOrderBloc>()
                              .add(PurchaseOrderEvent.createPurchaseOrder(newPurchaseOrder));
                        },
                      )
                    else if (currentStep == 1) ...[
                      UIButton.filled(
                        'Save',
                        onClick: () {
                          context.read<PurchaseOrderBloc>().add(
                                PurchaseOrderEvent.updatePurchaseOrder(
                                  action: UpdatePurchaseOrder.save,
                                  id: po.id!,
                                  po: po,
                                ),
                              );
                        },
                      ),
                      const UIHorizontalSpace(8),
                      UIButton.filled(
                        'Save and Mark as Shipped',
                        icon: Assets.icons.arrowRight1.setSize(12),
                        iconAlign: IconAlignment.end,
                        onClick: () {
                          context.read<PurchaseOrderBloc>().add(
                                PurchaseOrderEvent.updatePurchaseOrder(
                                  // Negative IDs are newly added items
                                  action: po.items?.any((item) => item.id! < 0) == true
                                      ? UpdatePurchaseOrder.saveAndMarkAsShippedWithNewItems
                                      : UpdatePurchaseOrder.saveAndMarkAsShipped,
                                  id: po.id!,
                                  po: po,
                                ),
                              );
                        },
                      ),
                    ] else if (currentStep == 2)
                      UIButton.filled(
                        'Save and Received',
                        icon: Assets.icons.arrowRight1.setSize(12),
                        iconAlign: IconAlignment.end,
                        onClick: () {
                          final poItems = po.items ?? [];
                          if (poItems.every((item) => item.quantityReceived != null)) {
                            context.read<PurchaseOrderBloc>().add(
                                  PurchaseOrderEvent.updatePurchaseOrder(
                                    action: UpdatePurchaseOrder.saveAndReceived,
                                    id: po.id!,
                                    po: po,
                                  ),
                                );
                          } else {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(value: context.read<PurchaseOrderFormCubit>()),
                                  BlocProvider.value(value: context.read<PurchaseOrderBloc>()),
                                ],
                                child: const UndeliveredItemsDialog(),
                              ),
                            );
                          }
                        },
                      ),
                  ],
                ),
              );
      },
    );
  }
}
