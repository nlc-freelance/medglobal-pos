import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/purchase_order_enum.dart';
import 'package:medglobal_admin_portal/core/utils/print_util.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderFormHeader extends StatelessWidget {
  const PurchaseOrderFormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderFormCubit, PurchaseOrderFormState>(
      builder: (context, state) {
        final po = state.purchaseOrder;
        final isCreateMode = po.id == null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isCreateMode
                ? const PageHeader(title: 'New Purchase Order')
                : PageHeader(
                    title: _title(po.status!),
                    titleTrailings: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Chip(
                          label: Text(
                            po.status!.label,
                            style: UIStyleText.chip.copyWith(color: StatusMapper.textColor(po.status!)),
                          ),
                          backgroundColor: StatusMapper.color(po.status!),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: UIColors.transparent),
                          ),
                        ),
                      ),
                      const UIHorizontalSpace(8),
                      if (_showOptions(po.status!))
                        UIPopupMenuButton<String>.icon(
                          onSelect: (menu) {
                            if (menu == 'Print Purchase Order') {
                              PrintUtil.generateAndPrintOpenPO(po);
                            }
                            if (menu == 'Cancel Purchase Order') {
                              context.read<PurchaseOrderBloc>().add(PurchaseOrderEvent.updatePurchaseOrder(
                                    action: UpdatePurchaseOrder.cancel,
                                    id: po.id!,
                                    po: po,
                                  ));
                            }
                            if (menu == 'Delete Purchase Order') {
                              context.read<PurchaseOrderBloc>().add(PurchaseOrderEvent.deletePurchaseOrder(po.id!));
                            }
                          },
                          icon: Assets.icons.more.setSize(20),
                          menuAsString: (menu) => menu,
                          menu: [
                            if (_showPrintOption(po.status!)) 'Print Purchase Order',
                            if (_showCancelDeleteOption(po.status!)) ...[
                              'Cancel Purchase Order',
                              'Delete Purchase Order',
                            ],
                          ],
                        ),
                    ],
                  ),
            if (isCreateMode) UIText.heading5('Step 1 of 4 - Creation') else _buildSubtitle(po.status!),
            const UIVerticalSpace(8),
          ],
        );
      },
    );
  }

  String _title(StockOrderStatus status) {
    switch (status) {
      case StockOrderStatus.NEW:
        return 'Edit Purchase Order';
      case StockOrderStatus.FOR_RECEIVING:
        return 'Receive Purchase Order';
      case StockOrderStatus.COMPLETED || StockOrderStatus.CANCELLED:
        return 'Purchase Order';
      default:
        return Strings.empty;
    }
  }

  Widget _buildSubtitle(StockOrderStatus status) {
    switch (status) {
      case StockOrderStatus.NEW:
        return UIText.heading5('Step 2 of 4 - Editing');
      case StockOrderStatus.FOR_RECEIVING:
        return UIText.heading5('Step 3 of 4 - Receiving');
      case StockOrderStatus.COMPLETED:
        return UIText.bodyRegular('This purchase order has been completed and closed.');
      default:
        return const SizedBox.shrink();
    }
  }

  bool _showOptions(StockOrderStatus status) =>
      status == StockOrderStatus.NEW ||
      status == StockOrderStatus.FOR_RECEIVING ||
      status == StockOrderStatus.COMPLETED;

  bool _showPrintOption(StockOrderStatus status) =>
      status == StockOrderStatus.FOR_RECEIVING || status == StockOrderStatus.COMPLETED;

  bool _showCancelDeleteOption(StockOrderStatus status) =>
      status == StockOrderStatus.NEW || status == StockOrderStatus.FOR_RECEIVING;
}
