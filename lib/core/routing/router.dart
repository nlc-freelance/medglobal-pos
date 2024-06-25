import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/features/authentication/presentation/pages/login_page.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/product_details_page.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/products/products_page.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_list/suppliers_page.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: LoginPage.route,
    routes: [
      GoRoute(
        path: LoginPage.route,
        pageBuilder: (context, state) => const NoTransitionPage(child: LoginPage()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => ScaffoldLayout(
          routerState: state,
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.products.name,
                path: SideMenuTreeItem.products.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.manageProducts.name,
                    path: SideMenuTreeItem.manageProducts.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: ProductsPage()),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.addProduct.name,
                    path: SideMenuTreeItem.addProduct.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: ProductDetailsPage()),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.suppliers.name,
                    path: SideMenuTreeItem.suppliers.path,
                    pageBuilder: (context, state) => const NoTransitionPage(child: SuppliersPage()),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.stockManagement.name,
                path: SideMenuTreeItem.stockManagement.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.supplyNeeds.name,
                    path: SideMenuTreeItem.supplyNeeds.path,
                    builder: (context, state) => const Text(
                      'Supply Needs',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.purchaseOrders.name,
                    path: SideMenuTreeItem.purchaseOrders.path,
                    builder: (context, state) => const Text(
                      'Purchase Orders',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.stockReturns.name,
                    path: SideMenuTreeItem.stockReturns.path,
                    builder: (context, state) => const Text(
                      'Stock Returns',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    routes: [
                      GoRoute(
                        name: 'New Stock Return',
                        path: 'new',
                        builder: (context, state) => const Text(
                          'New Stock Return',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.stockTakes.name,
                    path: SideMenuTreeItem.stockTakes.path,
                    builder: (context, state) => const Text(
                      'Stock Takes',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.stockTransfers.name,
                    path: SideMenuTreeItem.stockTransfers.path,
                    builder: (context, state) => const Text(
                      'Stock Transfers',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.transactions.name,
                path: SideMenuTreeItem.transactions.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.saleTransactions.name,
                    path: SideMenuTreeItem.saleTransactions.path,
                    builder: (context, state) => const Text(
                      'Sale Transactions',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.returnTransactions.name,
                    path: SideMenuTreeItem.returnTransactions.path,
                    builder: (context, state) => const Text(
                      'Return Transactions',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.manageReturns.name,
                path: SideMenuTreeItem.manageReturns.path,
                builder: (context, state) => const Text(
                  'Returns Management',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: SideMenuTreeItem.reports.name,
                path: SideMenuTreeItem.reports.path,
                builder: (context, state) => const SizedBox(),
                routes: [
                  GoRoute(
                    name: SideMenuTreeItem.productHistory.name,
                    path: SideMenuTreeItem.productHistory.path,
                    builder: (context, state) => const Text(
                      'Product History',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  GoRoute(
                    name: SideMenuTreeItem.salesReport.name,
                    path: SideMenuTreeItem.salesReport.path,
                    builder: (context, state) => const SizedBox(),
                    routes: [
                      GoRoute(
                        name: SideMenuTreeItem.salesPerCategory.name,
                        path: SideMenuTreeItem.salesPerCategory.path,
                        builder: (context, state) => const Text(
                          'Sales Per Category',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.salesPerBranch.name,
                        path: SideMenuTreeItem.salesPerBranch.path,
                        builder: (context, state) => const Text(
                          'Sales Per Branch',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      GoRoute(
                        name: SideMenuTreeItem.salesPerDay.name,
                        path: SideMenuTreeItem.salesPerDay.path,
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
    ],
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final isLoginRoute = state.matchedLocation == LoginPage.route;

      if (authState is UnauthenticatedState && !isLoginRoute) {
        return LoginPage.route;
      } else if (authState is AuthenticatedState && isLoginRoute) {
        return ProductsPage.route;
      }

      return null;
    },
  );
}
