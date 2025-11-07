import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/widgets/app_tab_bar.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';

class PurchaseOrderTabFilter extends StatelessWidget {
  const PurchaseOrderTabFilter({super.key, required this.onFetch});

  final VoidCallback onFetch;

  @override
  Widget build(BuildContext context) {
    return AppTabBar(
      onChangedTab: (index) => _onChangeTab(context, index),
      tabs: [
        'All Orders',
        StockOrderStatus.NEW.label,
        StockOrderStatus.FOR_RECEIVING.label,
        StockOrderStatus.COMPLETED.label,
        StockOrderStatus.CANCELLED.label,
      ],
    );
  }

  void _onChangeTab(BuildContext context, int index) {
    final status = switch (index) {
      0 => null,
      1 => StockOrderStatus.NEW,
      2 => StockOrderStatus.FOR_RECEIVING,
      3 => StockOrderStatus.COMPLETED,
      4 => StockOrderStatus.CANCELLED,
      _ => null, // optional default
    };

    context.read<PurchaseOrderListFilterCubit>().setStatus(status);

    // Schedule fetch after state update is applied
    onFetch();
  }
}
