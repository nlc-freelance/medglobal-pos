import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/route_guard.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/pos_scaffold_layout.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/login_page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/product_details_page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/products_page.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/presentation/product_history_page.dart';
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
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/register/register_page.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transactions_page.dart';

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
          child: ScaffoldLayout(
            routerState: state,
            navigationShell: navigationShell,
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
                    name: SideMenuTreeItem.SALES_REPORT.name,
                    path: SideMenuTreeItem.SALES_REPORT.path,
                    builder: (context, state) => const SizedBox(),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.SALES_PER_CATEGORY.name,
                        path: SideMenuTreeItem.SALES_PER_CATEGORY.path,
                        builder: (context, state) => const Text(
                          'Sales Per Category',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.SALES_PER_BRANCH.name,
                        path: SideMenuTreeItem.SALES_PER_BRANCH.path,
                        builder: (context, state) => const Text(
                          'Sales Per Branch',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.SALES_PER_DAY.name,
                        path: SideMenuTreeItem.SALES_PER_DAY.path,
                        builder: (context, state) => const Text(
                          'Sales Per Day',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
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
          child: POSScaffoldLayout(
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
                pageBuilder: (context, state) => const NoTransitionPage(child: RegisterPage()),
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
        return authState.user.type == UserType.CASHIER ? RegisterPage.route : ProductsPage.route;
      }

      return null;
    },
  );
}
