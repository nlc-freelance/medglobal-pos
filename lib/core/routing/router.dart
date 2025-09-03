import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/route_guard.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/pos_scaffold.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/login_page.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/employee_form_page.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_list/employee_list_page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/product_details_page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/products_page.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report_task.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list_bloc/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_manager_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/product_history_page.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_list/product_performance_list_page.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/bloc/product_sales_history_bloc/product_sales_history_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/bloc/product_sales_history_filter_cubit/product_sales_history_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/product_sales_history_page.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/sales_per_category_page.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/presentation/sales_per_shift_details/sales_per_shift_details_page.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/presentation/sales_per_shift_list/sales_per_shift_page.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_form/branch_form_page.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_list/branch_list_page.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_form/receipt_template_form_page.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_list/receipt_template_list_page.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/pages/register_list/register_list_page.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/pages/tax_list/tax_list_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/purchase_order_details_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/new/new_purchase_order_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/purchase_orders_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/new/new_stock_return_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stock_return_details_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_list/stock_returns_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_details/stock_take_details_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_list/stock_takes_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/new/new_stock_transfer_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stock_transfer_details_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_list/stock_transfers_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/pages/supply_needs_page.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_list/suppliers_page.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/pages/return_transaction_details/return_transaction_details_page.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/pages/return_transaction_list/returns_page.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/pages/sale_transaction_details/sale_transaction_details_page.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/pages/sale_transaction_list/sale_transactions_page.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/billing/billing_page.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/pos/point_of_sale_page.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transactions_page.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: LoginPage.route,
    routes: [
      GoRoute(
        path: LoginPage.route,
        pageBuilder: (context, state) => const NoTransitionPage(child: LoginPage()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => RouteGuard(
          allowedTypes: const [UserType.ADMIN, UserType.STORE_MANAGER],
          child: BlocListener<ReportManagerCubit, ReportManagerState>(
            listener: (context, state) {
              /// Displays a snackbar for every task that has failed.
              ///
              /// After showing the toast, the failed tasks are removed from the current state,
              /// *except* for those tasks that require source data input.
              /// Tasks requiring source data are retained in the state so that they can
              /// continue to be managed and possibly corrected within the form or UI.
              final failedTasks = state.tasks.failed;

              if (failedTasks.isNotEmpty) {
                for (ReportTask task in failedTasks) {
                  SnackbarUtil.error(context, task.error!);

                  final hasListAndRequiresSourceData = task.type.hasListAndRequiresSourceData;

                  /// If a report requires source data and is in creation state, do nothing
                  if (hasListAndRequiresSourceData && task.isInCreationState) return;

                  /// If a report requires source data and is already created,
                  /// but encountered failure during polling/generating/downloading, remove it from the list
                  if (hasListAndRequiresSourceData) {
                    context.read<ProductPerformanceListBloc>().add(ProductPerformanceListEvent.removeReport(task.id));
                  }

                  // Finally, remove from ReportManagerCubit
                  context.read<ReportManagerCubit>().removeTask(task.key);
                }
              }

              /// Displays a snackbar for every product performance task that is locally ready for download.
              /// Each toast includes an actionable button that allows the user to download the report directly.
              final localReadyProductPerformanceTasks = state.productPerformanceTasks.local.ready;

              if (localReadyProductPerformanceTasks.isNotEmpty) {
                for (ReportTask task in localReadyProductPerformanceTasks) {
                  SnackbarUtil.success(
                    context,
                    '${task.fileName} is ready to download.',
                    action: UIButton.text(
                      'Download',
                      onClick: () => context
                          .read<ReportManagerCubit>()
                          .manualDownloadReport(task.toReport(ReportStatus.completed)),
                    ),
                    onSnackbarClosed: () {
                      // Remove the task from the ReportManagerCubit when snackbar is dismissed (auto or manual)
                      // This ensures no duplicate snackbars are shown for the same task
                      context.read<ReportManagerCubit>().removeTask(task.key);
                    },
                  );
                }
              }
            },
            child: PortalScaffold(
              routerState: state,
              navigationShell: navigationShell,
            ),
          ),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.PRODUCT_MANAGEMENT.name,
                path: SideMenuTreeItem.PRODUCT_MANAGEMENT.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.SUPPLIERS.name,
                    path: SideMenuTreeItem.SUPPLIERS.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: SuppliersPage()),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.PRODUCTS.name,
                    path: SideMenuTreeItem.PRODUCTS.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: ProductsPage()),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.NEW_PRODUCT.name,
                        path: SideMenuTreeItem.NEW_PRODUCT.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: ProductDetailsPage()),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.PRODUCT_DETAILS.name,
                        path: SideMenuTreeItem.PRODUCT_DETAILS.path,
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: ProductDetailsPage(id: state.pathParameters['id'])),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.STOCK_MANAGEMENT.name,
                path: SideMenuTreeItem.STOCK_MANAGEMENT.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.SUPPLY_NEEDS.name,
                    path: SideMenuTreeItem.SUPPLY_NEEDS.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: SupplyNeedsPage()),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.PURCHASE_ORDERS.name,
                    path: SideMenuTreeItem.PURCHASE_ORDERS.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: PurchaseOrdersPage()),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.NEW_PURCHASE_ORDER.name,
                        path: SideMenuTreeItem.NEW_PURCHASE_ORDER.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: NewPurchaseOrderPage()),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.PURCHASE_ORDER_DETAILS.name,
                        path: SideMenuTreeItem.PURCHASE_ORDER_DETAILS.path,
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: PurchaseOrderDetailsPage(id: state.pathParameters['id']!)),
                      ),
                    ],
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.STOCK_RETURNS.name,
                    path: SideMenuTreeItem.STOCK_RETURNS.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: StockReturnsPage()),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.NEW_STOCK_RETURN.name,
                        path: SideMenuTreeItem.NEW_STOCK_RETURN.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: NewStockReturnPage()),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.STOCK_RETURN_DETAILS.name,
                        path: SideMenuTreeItem.STOCK_RETURN_DETAILS.path,
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: StockReturnDetailsPage(id: state.pathParameters['id']!)),
                      ),
                    ],
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.STOCK_TAKES.name,
                    path: SideMenuTreeItem.STOCK_TAKES.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: StockTakesPage()),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.STOCK_TAKE_DETAILS.name,
                        path: SideMenuTreeItem.STOCK_TAKE_DETAILS.path,
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: StockTakeDetailsPage(id: state.pathParameters['id']!)),
                      ),
                    ],
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.STOCK_TRANSFERS.name,
                    path: SideMenuTreeItem.STOCK_TRANSFERS.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: StockTransfersPage()),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.NEW_STOCK_TRANSFER.name,
                        path: SideMenuTreeItem.NEW_STOCK_TRANSFER.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: NewStockTransferPage()),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.STOCK_TRANSFER_DETAILS.name,
                        path: SideMenuTreeItem.STOCK_TRANSFER_DETAILS.path,
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: StockTransferDetailsPage(id: state.pathParameters['id']!)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.TRANSACTIONS.name,
                path: SideMenuTreeItem.TRANSACTIONS.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.SALE_TRANSACTIONS.name,
                    path: SideMenuTreeItem.SALE_TRANSACTIONS.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: SaleTransactionsPage()),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.SALE_TRANSACTION_DETAILS.name,
                        path: SideMenuTreeItem.SALE_TRANSACTION_DETAILS.path,
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: SaleTransactionDetailsPage(id: state.pathParameters['id']!)),
                      ),
                    ],
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.RETURN_TRANSACTIONS.name,
                    path: SideMenuTreeItem.RETURN_TRANSACTIONS.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: ReturnTransactionsPage()),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.RETURN_TRANSACTION_DETAILS.name,
                        path: SideMenuTreeItem.RETURN_TRANSACTION_DETAILS.path,
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: ReturnTransactionDetailsPage(id: state.pathParameters['id']!)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.REPORTS.name,
                path: SideMenuTreeItem.REPORTS.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.PRODUCT_HISTORY.name,
                    path: SideMenuTreeItem.PRODUCT_HISTORY.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: ProductHistoryPage()),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.PRODUCT_SALES_HISTORY.name,
                    path: SideMenuTreeItem.PRODUCT_SALES_HISTORY.path,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (context) => ProductSalesHistoryFilterCubit()),
                          BlocProvider(create: (context) => GetIt.I<ProductSalesHistoryBloc>()),
                        ],
                        child: const ProductSalesHistoryPage(),
                      ),
                    ),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.productPerformance.name,
                    path: SideMenuTreeItem.productPerformance.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: ProductPerformanceListPage()),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.SALES_REPORT.name,
                    path: SideMenuTreeItem.SALES_REPORT.path,
                    builder: (context, state) => const SizedBox(),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.SALES_PER_CATEGORY.name,
                        path: SideMenuTreeItem.SALES_PER_CATEGORY.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: SalesPerCategoryPage()),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.SALES_PER_SHIFT.name,
                        path: SideMenuTreeItem.SALES_PER_SHIFT.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: SalesPerShiftPage()),
                        routes: [
                          GoRoute(
                            name: SideMenuTreeItem.SALES_PER_SHIFT_DETAILS.name,
                            path: SideMenuTreeItem.SALES_PER_SHIFT_DETAILS.path,
                            pageBuilder: (context, state) =>
                                NoTransitionPage(child: SalesPerShiftDetailsPage(id: state.pathParameters['id']!)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.settings.name,
                path: SideMenuTreeItem.settings.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.tax.name,
                    path: SideMenuTreeItem.tax.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: TaxListPage()),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.posRegister.name,
                    path: SideMenuTreeItem.posRegister.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: RegisterListPage()),
                  ),
                  // Check the difference ShellRoute vs StatefullShellRoute, when navigating from the menu, does it keep state?
                  ShellRoute(
                    pageBuilder: (context, state, child) => NoTransitionPage(
                      child: BlocProvider(
                        create: (_) =>
                            GetIt.I<PaginatedListBloc<Branch>>()..add(const PaginatedListEvent<Branch>.fetch()),
                        child: child,
                      ),
                    ),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.branch.name,
                        path: SideMenuTreeItem.branch.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: BranchListPage()),
                        routes: [
                          GoRoute(
                            name: SideMenuTreeItem.newBranch.name,
                            path: SideMenuTreeItem.newBranch.path,
                            pageBuilder: (context, state) => const NoTransitionPage(child: BranchFormPage()),
                          ),
                          GoRoute(
                            name: SideMenuTreeItem.branchDetails.name,
                            path: SideMenuTreeItem.branchDetails.path,
                            pageBuilder: (context, state) =>
                                NoTransitionPage(child: BranchFormPage(id: state.pathParameters['id']!)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ShellRoute(
                    pageBuilder: (context, state, child) => NoTransitionPage(
                      child: BlocProvider(
                        create: (_) => GetIt.I<PaginatedListBloc<ReceiptTemplate>>()
                          ..add(const PaginatedListEvent<ReceiptTemplate>.fetch()),
                        child: child,
                      ),
                    ),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.receiptTemplate.name,
                        path: SideMenuTreeItem.receiptTemplate.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: ReceiptTemplateListPage()),
                        routes: [
                          GoRoute(
                            name: SideMenuTreeItem.newReceiptTemplate.name,
                            path: SideMenuTreeItem.newReceiptTemplate.path,
                            pageBuilder: (context, state) => const NoTransitionPage(child: ReceiptTemplateFormPage()),
                          ),
                          GoRoute(
                            name: SideMenuTreeItem.receiptTemplateDetails.name,
                            path: SideMenuTreeItem.receiptTemplateDetails.path,
                            pageBuilder: (context, state) =>
                                NoTransitionPage(child: ReceiptTemplateFormPage(id: state.pathParameters['id']!)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.employees.name,
                path: SideMenuTreeItem.employees.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  ShellRoute(
                    // pageBuilder: (context, state, child) => NoTransitionPage(
                    //   // child: BlocProvider(
                    //   //   create: (_) => GetIt.I<PaginatedListBloc<ReceiptTemplate>>()
                    //   //     ..add(const PaginatedListEvent<ReceiptTemplate>.fetch()),
                    //   child: child,
                    //   // ),
                    // ),
                    pageBuilder: (context, state, child) => NoTransitionPage(
                      child: BlocProvider(
                        create: (_) =>
                            GetIt.I<PaginatedListBloc<Employee>>()..add(const PaginatedListEvent<Employee>.fetch()),
                        child: child,
                      ),
                    ),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.employee.name,
                        path: SideMenuTreeItem.employee.path,
                        pageBuilder: (context, state) => const NoTransitionPage(child: EmployeeListPage()),
                        routes: [
                          GoRoute(
                            name: SideMenuTreeItem.newEmployee.name,
                            path: SideMenuTreeItem.newEmployee.path,
                            pageBuilder: (context, state) => const NoTransitionPage(child: EmployeeFormPage()),
                          ),
                          GoRoute(
                            name: SideMenuTreeItem.employeeDetails.name,
                            path: SideMenuTreeItem.employeeDetails.path,
                            pageBuilder: (context, state) =>
                                NoTransitionPage(child: EmployeeFormPage(id: state.pathParameters['id']!)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => RouteGuard(
          allowedTypes: const [UserType.CASHIER],
          child: PosScaffold(
            routerState: state,
            navigationShell: navigationShell,
          ),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'Register',
                path: '/point-of-sale/register',
                pageBuilder: (context, state) => const NoTransitionPage(child: PointOfSalePage()),
              ),
              GoRoute(
                name: 'Billing',
                path: '/point-of-sale/register/billing',
                pageBuilder: (context, state) => const NoTransitionPage(child: BillingPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'POS Transactions',
                path: '/point-of-sale/transactions',
                pageBuilder: (context, state) => const NoTransitionPage(child: TransactionsPage()),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final isLoginRoute = state.matchedLocation == LoginPage.route;

      if (authState is UnauthenticatedState && !isLoginRoute) {
        return LoginPage.route;
      } else if (authState is AuthenticatedState && isLoginRoute) {
        if (authState.user.type == UserType.STORE_MANAGER) return PurchaseOrdersPage.route;
        return authState.user.type == UserType.CASHIER ? PointOfSalePage.route : ProductsPage.route;
      }

      return null;
    },
  );
}
