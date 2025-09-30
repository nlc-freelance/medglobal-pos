import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/datagrid/purchase_order_items_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/datagrid/purchase_order_received_items_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/datagrid/purchase_order_receiving_items_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/widgets/purchase_order_general_info.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/form/widgets/purchase_order_notes.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderForm extends StatelessWidget {
  const PurchaseOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderFormCubit, PurchaseOrderFormState>(
      builder: (context, state) {
        final status = state.purchaseOrder.status;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageSectionTitle(title: 'General Information'),
            const PurchaseOrderGeneralInfo(),
            const UIVerticalSpace(40),
            switch (status) {
              StockOrderStatus.NEW => const PurchaseOrderItemsDataGrid(),
              StockOrderStatus.FOR_RECEIVING => const PurchaseOrderReceivingItemsDataGrid(),
              StockOrderStatus.COMPLETED => const PurchaseOrderReceivedItemsDataGrid(),
              StockOrderStatus.CANCELLED => const PurchaseOrderReceivedItemsDataGrid(),
              _ => const SizedBox.shrink(),
            },
            const UIVerticalSpace(40),
            const PurchaseOrderNotes(),
          ],
        );
      },
    );
  }
}
