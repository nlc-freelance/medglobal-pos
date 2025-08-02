import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/app_gap.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/widgets/data_grid/purchase_order_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/widgets/purchase_order_header.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/widgets/purchase_order_tab_filter.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/widgets/purchase_order_toolbar.dart';

class PurchaseOrderListPage extends StatefulWidget {
  static String route = '/stocks/purchase-orders';

  const PurchaseOrderListPage({super.key});

  @override
  State<PurchaseOrderListPage> createState() => _PurchaseOrdersPageState();
}

class _PurchaseOrdersPageState extends State<PurchaseOrderListPage> {
  @override
  void initState() {
    super.initState();

    /// TODO: The list does not update when using the back button or side menu to navigate back to this page
    /// Side menu which uses goNamed does not trigger initState if the path is in the same shell branch
    /// Ex. /stock-management/purchase-orders/id=1 to /stock-management/purchase-orders/
    // context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders();

    /// Reset last selected purchase order
    // context.read<PurchaseOrderCubit>().reset();
    // context.read<PurchaseOrderListFilterCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PurchaseOrderHeader(),
        const AppGap.v(20),
        PurchaseOrderTabFilter(onFetch: _scheduleFetch),
        const AppGap.v(20),
        PurchaseOrderToolbar(onFetch: _scheduleFetch),
        const Expanded(child: PurchaseOrderDataGrid()),
      ],
    );
  }

  /// Defers fetching purchase orders until after the filter state is updated.
  ///
  /// Uses [Future.microtask] to ensure state changes are applied
  /// before dispatching the fetch event to the list BLoC.
  void _scheduleFetch() {
    final filterCubit = context.read<PurchaseOrderListFilterCubit>();
    final listBloc = context.read<PaginatedListBloc<PurchaseOrder>>();

    Future.microtask(() {
      final updatedQuery = filterCubit.state.toPageQuery;
      listBloc.add(PaginatedListEvent<PurchaseOrder>.fetch(query: updatedQuery));
    });
  }
}
