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
    context.read<PaginatedListBloc<PurchaseOrder>>().add(const PaginatedListEvent<PurchaseOrder>.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PurchaseOrderHeader(),
        PurchaseOrderTabFilter(onFetch: _scheduleFetch),
        const AppGap.v(20),
        PurchaseOrderToolbar(onFetch: _scheduleFetch),
        const AppGap.v(20),
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

    context.read<PurchaseOrderListFilterCubit>().resetPageAndSize();

    Future.microtask(() {
      final updatedQuery = filterCubit.state.toPageQuery();
      listBloc.add(PaginatedListEvent<PurchaseOrder>.fetch(query: updatedQuery));
    });
  }
}
