import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/entities/product_history_item.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/product_history_detail_bloc/product_history_detail_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/report_bloc/report_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/report_manager_cubit/report_manager_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_filter/sales_category_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_group_by/sales_category_groupby_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_period/sales_category_period_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_per_category/sales_per_category_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift/sales_per_shift_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift_filter/sales_per_shift_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift_list/sales_per_shift_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/shift_transactions/shift_transaction_page_size_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/shift_transactions/shift_transactions_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
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
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_lazy_list/supplier_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/bloc/transaction_bloc.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/pos/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/device_register/device_register_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/receipt_config/receipt_config_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register/active_register_cubit.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/app_session/presentation/app_session_bloc.dart';
import 'package:medglobal_admin_portal/pos/sync/sync_bloc/sync_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class MedGlobaPortalApp extends StatelessWidget {
  const MedGlobaPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()..add(const AppInitEvent())),
        BlocProvider(create: (_) => GetIt.I<LazyListBloc<Register>>()),

        if (AppConfig.isPortalApp) ...[
          // Portal only
          BlocProvider(create: (_) => GetIt.I<LazyListBloc<Category>>()),
          BlocProvider(create: (_) => GetIt.I<LazyListBloc<Supplier>>()),
          BlocProvider(create: (_) => GetIt.I<LazyListBloc<Branch>>()),
          BlocProvider(create: (_) => GetIt.I<LazyListBloc<BranchPartial>>()),
          BlocProvider(create: (_) => GetIt.I<LazyListBloc<Tax>>()),
          BlocProvider(create: (_) => GetIt.I<LazyListBloc<ReceiptTemplate>>()),
          BlocProvider(create: (_) => GetIt.I<ReportBloc>()),
          BlocProvider(create: (_) => GetIt.I<ReportManagerCubit>()),
          BlocProvider(create: (_) => GetIt.I<TransactionBloc>()),
          BlocProvider(create: (_) => GetIt.I<SidebarCubit>()),
        ],

        if (AppConfig.isPOSApp) ...[
          //  POS only
          BlocProvider(create: (_) => GetIt.I<SyncBloc>()..add(SyncEvent.start())),
          BlocProvider(create: (_) => GetIt.I<RegisterShiftBloc>()),
          BlocProvider(create: (_) => GetIt.I<ConnectivityCubit>()..monitorConnection()),
          BlocProvider(create: (_) => GetIt.I<AppSessionBloc>()),
          BlocProvider(create: (_) => ActiveRegisterCubit()),
          // BlocProvider(create: (_) => GetIt.I<ReceiptConfigurationBloc>()),
        ],

        /// TODOs: Add to portal only
        // Portal > Stock Management
        BlocProvider(create: (_) => GetIt.I<SupplyNeedCubit>()),
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

        // Portal > Transactions
        BlocProvider(create: (_) => GetIt.I<SaleTransactionListCubit>()),
        BlocProvider(create: (_) => GetIt.I<SaleTransactionListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReturnTransactionListCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReturnTransactionListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReturnCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReturnRemoteCubit>()),

        // Portal > SupplierDropdown
        BlocProvider(create: (_) => GetIt.I<SupplierLazyListCubit>()),

        // Portal > Reports
        BlocProvider(create: (_) => GetIt.I<ProductHistoryListCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductHistoryListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<SalesCategoryFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<SalesCategoryGroupByCubit>()),
        BlocProvider(create: (_) => GetIt.I<SalesCategoryPeriodCubit>()),
        BlocProvider(create: (_) => GetIt.I<SalesPerCategoryCubit>()),
        BlocProvider(create: (_) => GetIt.I<SalesPerShiftListCubit>()),
        BlocProvider(create: (_) => GetIt.I<SalesPerShiftListFilterCubit>()),
        BlocProvider(create: (_) => GetIt.I<SalesPerShiftCubit>()),
        BlocProvider(create: (_) => GetIt.I<ShiftTransactionsCubit>()),
        BlocProvider(create: (_) => GetIt.I<ShiftTransactionPageSizeCubit>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // if (state is AuthenticatedState) {
          //   if (AppConfig.isPOSApp && state.user.type == UserType.cashier) {
          //     context.read<ActiveRegisterCubit>().loadRegister();
          //   }
          // }

          AppRouter.router.refresh();
        },
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
