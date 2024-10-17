import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/branches/cubit/branch_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/category/category_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/category/category_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product/product_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_bulk_action/product_bulk_action_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list_search_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/presentation/cubit/product_history_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/presentation/cubit/product_history_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_remote/purchase_order_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/new_stock_return/new_stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_filter/stock_return_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_remote/stock_return_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_remote/stock_return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/bloc/stock_take_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/new_stock_take/new_stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/uncounted_items_draft/uncounted_items_draft_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/stock_take_items_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/uncounted_items_list/uncounted_items_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/uncounted_items_list/uncounted_items_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_filter/stock_transfer_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_remote/stock_transfer_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/cubit/supply_need/supply_need_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/cubit/supply_needs/supply_needs_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_lazy_list/supplier_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

import 'shared/register/presentation/cubit/register_lazy_list/register_lazy_list_cubit.dart';

class MedGlobaPortalApp extends StatelessWidget {
  const MedGlobaPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()..add(const AppInitEvent())),
        BlocProvider(create: (_) => GetIt.I<SidebarCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplierListCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplierListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplierCubit>()),
        BlocProvider(create: (_) => GetIt.I<CategoryCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductSelectionCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductBulkActionCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductListCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductListSearchCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductFormCubit>()),
        BlocProvider(create: (_) => GetIt.I<VariantFormCubit>()),
        BlocProvider(create: (_) => GetIt.I<VariantFormUiCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplyNeedsCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplyNeedCubit>()),
        BlocProvider(create: (_) => GetIt.I<PurchaseOrderListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<PurchaseOrderListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<PurchaseOrderRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<PurchaseOrderCubit>()),
        BlocProvider(create: (_) => GetIt.I<NewPurchaseOrderCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockReturnListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockReturnListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockReturnRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockReturnCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTakeItemsCubit>()),
        BlocProvider(create: (_) => GetIt.I<NewStockReturnCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTransferListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTransferListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTransferRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTransferCubit>()),
        BlocProvider(create: (_) => GetIt.I<NewStockTransferCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTakeListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTakeListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTakeBloc>()),
        BlocProvider(create: (_) => GetIt.I<UncountedItemsListCubit>()),
        BlocProvider(create: (_) => GetIt.I<UncountedItemsListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<CountedItemsListCubit>()),
        BlocProvider(create: (_) => GetIt.I<CountedItemsListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTakeCubit>()),
        BlocProvider(create: (_) => GetIt.I<NewStockTakeCubit>()),
        BlocProvider(create: (_) => GetIt.I<UncountedItemsDraftCubit>()),
        BlocProvider(create: (_) => GetIt.I<RegisterCubit>()),
        BlocProvider(create: (_) => GetIt.I<RegisterShiftBloc>()),
        BlocProvider(create: (_) => GetIt.I<POSProductListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductSearchCubit>()),
        BlocProvider(create: (_) => GetIt.I<OrderCubit>()),
        BlocProvider(create: (_) => GetIt.I<SaleRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<SaleTransactionListCubit>()),
        BlocProvider(create: (_) => GetIt.I<SaleTransactionListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<TransactionCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReturnTransactionListCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReturnTransactionListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<TransactionListByBranchCubit>()),
        BlocProvider(create: (_) => GetIt.I<RefundCubit>()),
        BlocProvider(create: (_) => GetIt.I<RefundRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReturnCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReturnRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<PrintReceiptCubit>()),
        BlocProvider(create: (_) => GetIt.I<CategoryLazyListCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplierLazyListCubit>()),
        BlocProvider(create: (_) => GetIt.I<BranchLazyListCubit>()),
        BlocProvider(create: (_) => GetIt.I<RegisterLazyListCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductHistoryListCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductHistoryListFilterCubit>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) => AppRouter.router.refresh(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'MedGlobal Admin Portal',
          theme: UITheme.theme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
