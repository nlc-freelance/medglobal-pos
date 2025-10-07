import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/route_guard.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/portal/portal_scaffold.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/employee_form_page.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_list/employee_list_page.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bulk_bloc/product_bulk_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list_filter_cubit/product_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/product_form_page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/product_list_page.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report_task.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_list/product_performance_list_page.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/report_manager_cubit/report_manager_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/product_history_detail_bloc/product_history_detail_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/product_history_page.dart';
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
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/purchase_order_details_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/new/new_purchase_order_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/purchase_order_list_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/new/new_stock_return_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stock_return_details_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_list/stock_returns_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/bloc/stock_take_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/new_stock_take/new_stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_details/stock_take_details_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_list/stock_takes_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/new/new_stock_transfer_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stock_transfer_details_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_list/stock_transfers_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/pages/supply_needs_page.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_list/supplier_list_page.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/pages/return_transaction_details/return_transaction_details_page.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/pages/return_transaction_list/returns_page.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/pages/sale_transaction_details/sale_transaction_details_page.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/pages/sale_transaction_list/sale_transactions_page.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

final ShellRoute portalRoutes = ShellRoute(
  builder: (context, state, child) => RouteGuard(
    allowedRoles: const [UserType.admin, UserType.supervisor],
    allowedPlatforms: const [PlatformType.web],
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
                onClick: () =>
                    context.read<ReportManagerCubit>().manualDownloadReport(task.toReport(ReportStatus.completed)),
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
        route: state,
        child: child,
      ),
    ),
  ),
  routes: [
    /// Product Management
    ///
    GoRoute(
      path: '/products/suppliers',
      name: 'supplierList',
      pageBuilder: (context, state) => const NoTransitionPage(child: SupplierListPage()),
    ),
    ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetIt.I<PaginatedListBloc<Product>>()
                ..add(
                  const PaginatedListEvent<Product>.fetch(),
                ),
            ),
            BlocProvider(create: (context) => GetIt.I<ProductBulkBloc>()),
            BlocProvider(create: (context) => ProductListFilterCubit()),
            BlocProvider(create: (context) => ProductSelectionCubit()),
          ],
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          path: '/products',
          name: 'productList',
          pageBuilder: (context, state) => const NoTransitionPage(child: ProductListPage()),
          routes: [
            GoRoute(
              path: 'new',
              name: 'productCreate',
              pageBuilder: (context, state) => const NoTransitionPage(child: ProductFormPage()),
            ),
            GoRoute(
              path: ':id',
              name: 'productDetails',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id'];
                return NoTransitionPage(child: ProductFormPage(id: id));
              },
            ),
          ],
        ),
      ],
    ),

    /// Stock Management
    ///
    GoRoute(
      path: '/stocks',
      builder: (context, state) => const SizedBox(),
      routes: [
        // GoRoute(
        //   path: 'supply-needs',
        //   name: 'supplyNeedList',
        //   pageBuilder: (context, state) => const NoTransitionPage(child: SupplyNeedListPage()),
        // ),
        ShellRoute(
          pageBuilder: (context, state, child) => NoTransitionPage(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => GetIt.I<PaginatedListBloc<PurchaseOrder>>()),
                BlocProvider(create: (context) => PurchaseOrderListFilterCubit()),
                BlocProvider(create: (context) => PurchaseOrderFormCubit()),
              ],
              child: child,
            ),
          ),
          routes: [
            GoRoute(
              path: 'purchase-orders',
              name: 'purchaseOrderList',
              pageBuilder: (context, state) => const NoTransitionPage(child: PurchaseOrderListPage()),
              routes: [
                GoRoute(
                  path: 'new',
                  name: 'purchaseOrderCreate',
                  pageBuilder: (context, state) => const NoTransitionPage(child: PurchaseOrderDetailsPage()),
                ),
                GoRoute(
                  path: ':id',
                  name: 'purchaseOrderDetails',
                  pageBuilder: (context, state) {
                    final id = state.pathParameters['id'];
                    return NoTransitionPage(child: PurchaseOrderDetailsPage(id: id!));
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'stock-returns',
          name: 'stockReturnList',
          pageBuilder: (context, state) => const NoTransitionPage(child: StockReturnListPage()),
          routes: [
            GoRoute(
              path: 'new',
              name: 'stockReturnCreate',
              pageBuilder: (context, state) => const NoTransitionPage(child: NewStockReturnPage()),
            ),
            GoRoute(
              path: ':id',
              name: 'stockReturnDetails',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;
                return NoTransitionPage(child: StockReturnDetailsPage(id: id));
              },
            ),
          ],
        ),
        ShellRoute(
          pageBuilder: (context, state, child) => NoTransitionPage(
            child: MultiBlocProvider(
              providers: [
                // BlocProvider(create: (context) => GetIt.I<PaginatedListBloc<StockTake>>()),
                // BlocProvider(create: (context) => StockTakeListFilterCubit()),
                // BlocProvider(create: (context) => NewStockTakeCubit()),
                BlocProvider(create: (context) => GetIt.I<StockTakeBloc>()),
              ],
              child: child,
            ),
          ),
          routes: [
            GoRoute(
              path: 'stock-takes',
              name: 'stockTakeList',
              pageBuilder: (context, state) => const NoTransitionPage(child: StockTakeListPage()),
              routes: [
                GoRoute(
                  path: ':id',
                  name: 'stockTakeDetails',
                  pageBuilder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return NoTransitionPage(child: StockTakeDetailsPage(id: id));
                  },
                ),
              ],
            ),
          ],
        ),

        // GoRoute(
        //   path: 'stock-transfers',
        //   name: 'stockTransferList',
        //   pageBuilder: (context, state) => const NoTransitionPage(child: StockTransferListPage()),
        //   routes: [
        //     GoRoute(
        //       path: 'new',
        //       name: 'stockTransferCreate',
        //       pageBuilder: (context, state) => const NoTransitionPage(child: NewStockTransferPage()),
        //     ),
        //     GoRoute(
        //       path: ':id',
        //       name: 'stockTransferDetails',
        //       pageBuilder: (context, state) {
        //         final id = state.pathParameters['id']!;
        //         return NoTransitionPage(child: StockTransferDetailsPage(id: id));
        //       },
        //     ),
        //   ],
        // ),
      ],
    ),

    /// Transactions
    ///
    GoRoute(
      path: '/transactions',
      builder: (context, state) => const SizedBox(),
      routes: [
        GoRoute(
          path: 'sales',
          name: 'saleTransactionList',
          pageBuilder: (context, state) => const NoTransitionPage(child: SaleTransactionListPage()),
          routes: [
            GoRoute(
              path: ':id',
              name: 'saleTransactionDetails',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;
                return NoTransitionPage(child: SaleTransactionDetailsPage(id: id));
              },
            ),
          ],
        ),
        GoRoute(
          path: 'returns',
          name: 'returnTransactionList',
          pageBuilder: (context, state) => const NoTransitionPage(child: ReturnTransactionListPage()),
          routes: [
            GoRoute(
              path: ':id',
              name: 'returnTransactionDetails',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;
                return NoTransitionPage(child: ReturnTransactionDetailsPage(id: id));
              },
            ),
          ],
        ),
      ],
    ),

    /// Reports
    ///
    ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: BlocProvider(
          create: (context) => GetIt.I<ProductHistoryDetailBloc>(),
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          path: '/reports',
          builder: (context, state) => const SizedBox(),
          routes: [
            GoRoute(
              path: 'products',
              builder: (context, state) => const SizedBox(),
              routes: [
                GoRoute(
                  path: 'product-history',
                  name: 'productHistoryReport',
                  pageBuilder: (context, state) => const NoTransitionPage(child: ProductHistoryPage()),
                ),
                GoRoute(
                  path: 'product-sales-history',
                  name: 'productSalesHistoryReport',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => GetIt.I<ProductSalesHistoryBloc>()),
                        BlocProvider(create: (context) => ProductSalesHistoryFilterCubit()),
                      ],
                      child: const ProductSalesHistoryPage(),
                    ),
                  ),
                ),
                GoRoute(
                  path: 'product-performance',
                  name: 'productPerformanceReports',
                  pageBuilder: (context, state) => const NoTransitionPage(child: ProductPerformanceListPage()),
                )
              ],
            ),
            GoRoute(
              path: 'sales',
              builder: (context, state) => const SizedBox(),
              routes: [
                GoRoute(
                  path: 'sales-per-category',
                  name: 'salesPerCategoryDetails',
                  pageBuilder: (context, state) => const NoTransitionPage(child: SalesPerCategoryPage()),
                ),
                GoRoute(
                  path: 'sales-per-shift',
                  name: 'salesPerShiftList',
                  pageBuilder: (context, state) => const NoTransitionPage(child: SalesPerShiftPage()),
                  routes: [
                    GoRoute(
                      path: ':id',
                      name: 'salesPerShiftDetails',
                      pageBuilder: (context, state) {
                        final id = state.pathParameters['id']!;
                        return NoTransitionPage(child: SalesPerShiftDetailsPage(id: id));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    /// Employee
    ///

    // ShellRoute(
    //   pageBuilder: (context, state, child) => NoTransitionPage(
    //     child: BlocProvider(
    //       create: (context) => GetIt.I<PaginatedListBloc<Employee>>()
    //         ..add(
    //           const PaginatedListEvent<Employee>.fetch(),
    //         ),
    //       child: child,
    //     ),
    //   ),
    //   routes: [
    //     GoRoute(
    //       path: '/employees',
    //       name: 'employeeList',
    //       pageBuilder: (context, state) => const NoTransitionPage(child: EmployeeListPage()),
    //       routes: [
    //         GoRoute(
    //           path: 'new',
    //           name: 'employeeCreate',
    //           pageBuilder: (context, state) => const NoTransitionPage(child: EmployeeFormPage()),
    //         ),
    //         GoRoute(
    //           path: ':id',
    //           name: 'employeeDetails',
    //           pageBuilder: (context, state) {
    //             final id = state.pathParameters['id'];
    //             return NoTransitionPage(child: EmployeeFormPage(id: id));
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // ),

    /// Settings
    ///
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SizedBox(),
      routes: [
        GoRoute(
          path: 'tax-codes',
          name: 'taxCodeList',
          pageBuilder: (context, state) => const NoTransitionPage(child: TaxListPage()),
        ),
        GoRoute(
          path: 'pos-registers',
          name: 'posRegisterList',
          pageBuilder: (context, state) => const NoTransitionPage(child: RegisterListPage()),
        ),
        ShellRoute(
          pageBuilder: (context, state, child) => NoTransitionPage(
            child: BlocProvider(
              create: (context) => GetIt.I<PaginatedListBloc<Branch>>()
                ..add(
                  const PaginatedListEvent<Branch>.fetch(),
                ),
              child: child,
            ),
          ),
          routes: [
            GoRoute(
              path: 'branches',
              name: 'branchList',
              pageBuilder: (context, state) => const NoTransitionPage(child: BranchListPage()),
              routes: [
                GoRoute(
                  path: 'new',
                  name: 'branchCreate',
                  pageBuilder: (context, state) => const NoTransitionPage(child: BranchFormPage()),
                ),
                GoRoute(
                  path: ':id',
                  name: 'branchDetails',
                  pageBuilder: (_, state) {
                    final id = state.pathParameters['id'];
                    return NoTransitionPage(child: BranchFormPage(id: id));
                  },
                ),
              ],
            ),
          ],
        ),
        ShellRoute(
          pageBuilder: (context, state, child) => NoTransitionPage(
            child: BlocProvider(
              create: (context) => GetIt.I<PaginatedListBloc<ReceiptTemplate>>()
                ..add(
                  const PaginatedListEvent<ReceiptTemplate>.fetch(),
                ),
              child: child,
            ),
          ),
          routes: [
            GoRoute(
              path: 'receipt-templates',
              name: 'receiptTemplateList',
              pageBuilder: (context, state) => const NoTransitionPage(child: ReceiptTemplateListPage()),
              routes: [
                GoRoute(
                  path: 'new',
                  name: 'receiptTemplateCreate',
                  pageBuilder: (context, state) => const NoTransitionPage(child: ReceiptTemplateFormPage()),
                ),
                GoRoute(
                  path: ':id',
                  name: 'receiptTemplateDetails',
                  pageBuilder: (context, state) {
                    final id = state.pathParameters['id'];
                    return NoTransitionPage(child: ReceiptTemplateFormPage(id: id));
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
