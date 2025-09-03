import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/portal/widgets/sidebar_item.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/portal/widgets/sidebar_section.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PortalSideBar1 extends StatefulWidget {
  const PortalSideBar1({super.key});

  @override
  State<PortalSideBar1> createState() => _PortalSideBar1State();
}

class _PortalSideBar1State extends State<PortalSideBar1> {
  String? expandedKey;

  @override
  void initState() {
    super.initState();
    // toggleExpansion('/products');
    WidgetsBinding.instance.addPostFrameCallback((_) => toggleExpansion(context.baseRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      backgroundColor: UIColors.background,
      shape: const Border(right: BorderSide(color: UIColors.borderMuted)),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.images.logoDrawer.image(),
                InkWell(
                  onTap: () => context.read<SidebarCubit>().closeSideBar(),
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Assets.icons.arrowLeft.svg(colorFilter: UIColors.textLight.toColorFilter),
                  ),
                ),
              ],
            ),
          ),
          const UIVerticalSpace(24),
          BlocSelector<AuthBloc, AuthState, UserType?>(
            selector: (state) {
              if (state is AuthenticatedState) return state.user.type;
              return null;
            },
            builder: (context, userType) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Management
                  ///
                  SidebarSection(
                    leading: icon('/products'),
                    title: 'Product Management',
                    isExpanded: expandedKey == '/products',
                    onToggle: () => toggleExpansion('/products'),
                    hasSelection: context.isSubrouteOf('/products'),
                    children: const [
                      SidebarItem(
                        title: 'Suppliers',
                        route: '/products/suppliers',
                        routeName: 'supplierList',
                      ),
                      SidebarItem(
                        title: 'Products',
                        route: '/products',
                        routeName: 'productList',
                        ignoreSubpaths: ['suppliers'],
                      ),
                    ],
                  ),

                  /// Stock Management
                  ///
                  SidebarSection(
                    leading: icon('/stocks'),
                    title: 'Stock Management',
                    isExpanded: expandedKey == '/stocks',
                    onToggle: () => toggleExpansion('/stocks'),
                    hasSelection: context.isSubrouteOf('/stocks'),
                    children: const [
                      SidebarItem(
                        title: 'Supply Needs',
                        route: '/stocks/supply-needs',
                        routeName: 'supplyNeedList',
                      ),
                      SidebarItem(
                        title: 'Purchase Orders',
                        route: '/stocks/purchase-orders',
                        routeName: 'purchaseOrderList',
                      ),
                      SidebarItem(
                        title: 'Stock Returns',
                        route: '/stocks/stock-returns',
                        routeName: 'stockReturnList',
                      ),
                      SidebarItem(
                        title: 'Stock Takes',
                        route: '/stocks/stock-takes',
                        routeName: 'stockTakeList',
                      ),
                      SidebarItem(
                        title: 'Stock Transfers',
                        route: '/stocks/stock-transfers',
                        routeName: 'stockTransferList',
                      ),
                    ],
                  ),

                  /// Transations
                  ///
                  SidebarSection(
                    leading: icon('/transactions'),
                    title: 'Transactions',
                    isExpanded: expandedKey == '/transactions',
                    onToggle: () => toggleExpansion('/transactions'),
                    hasSelection: context.isSubrouteOf('/transactions'),
                    children: const [
                      SidebarItem(
                        title: 'Sales',
                        route: '/transactions/sales',
                        routeName: 'saleTransactionList',
                      ),
                      SidebarItem(
                        title: 'Returns',
                        route: '/transactions/returns',
                        routeName: 'returnTransactionList',
                      ),
                    ],
                  ),

                  /// Reports
                  ///
                  SidebarSection(
                    leading: icon('/reports'),
                    title: 'Reports',
                    isExpanded: expandedKey == '/reports' ||
                        expandedKey == '/reports/sales' ||
                        expandedKey == '/reports/products',
                    onToggle: () => toggleExpansion('/reports'),
                    hasSelection: context.isSubrouteOf('/reports'),
                    children: [
                      SidebarSection(
                        title: 'Products',
                        isExpanded: expandedKey == '/reports/products',
                        onToggle: () => setState(() {
                          if (expandedKey == '/reports/products') {
                            expandedKey = '/reports';
                          } else {
                            expandedKey = '/reports/products';
                          }
                        }),
                        hasSelection: context.isSubrouteOf('/reports/products'),
                        children: const [
                          SidebarItem(
                            title: 'Product History',
                            route: '/reports/products/product-history',
                            routeName: 'productHistoryReport',
                          ),
                          SidebarItem(
                            title: 'Product Sales History',
                            route: '/reports/products/product-sales-history',
                            routeName: 'productSalesHistoryReport',
                          ),
                          SidebarItem(
                            title: 'Product Performance',
                            route: '/reports/products/product-performance',
                            routeName: 'productPerformanceReports',
                          ),
                        ],
                      ),
                      SidebarSection(
                        title: 'Sales',
                        isExpanded: expandedKey == '/reports/sales',
                        onToggle: () => setState(() {
                          if (expandedKey == '/reports/sales') {
                            expandedKey = '/reports';
                          } else {
                            expandedKey = '/reports/sales';
                          }
                        }),
                        hasSelection: context.isSubrouteOf('/reports/sales'),
                        children: const [
                          SidebarItem(
                            title: 'Sales per Category',
                            route: '/reports/sales/sales-per-category',
                            routeName: 'salesPerCategoryDetails',
                          ),
                          SidebarItem(
                            title: 'Sales per Shift',
                            route: '/reports/sales/sales-per-shift',
                            routeName: 'salesPerShiftList',
                          ),
                        ],
                      )
                    ],
                  ),

                  /// Employees
                  ///
                  SidebarSection(
                    leading: icon('/employees'),
                    title: 'Employees',
                    isExpanded: expandedKey == '/employees',
                    onToggle: () => toggleExpansion('/employees'),
                    hasSelection: context.isSubrouteOf('/employees'),
                    children: const [
                      SidebarItem(
                        title: 'Manage Employees',
                        route: '/employees',
                        routeName: 'employeeList',
                      ),
                    ],
                  ),

                  /// Settings
                  ///
                  SidebarSection(
                    leading: icon('/settings'),
                    title: 'Settings',
                    isExpanded: expandedKey == '/settings',
                    onToggle: () => toggleExpansion('/settings'),
                    hasSelection: context.isSubrouteOf('/settings'),
                    children: const [
                      SidebarItem(
                        title: 'Tax',
                        route: '/settings/tax-codes',
                        routeName: 'taxCodeList',
                      ),
                      SidebarItem(
                        title: 'Branch',
                        route: '/settings/branches',
                        routeName: 'branchList',
                      ),
                      SidebarItem(
                        title: 'POS Register',
                        route: '/settings/pos-registers',
                        routeName: 'posRegisterList',
                      ),
                      SidebarItem(
                        title: 'Receipt Template',
                        route: '/settings/receipt-templates',
                        routeName: 'receiptTemplateList',
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void toggleExpansion(String? key) => setState(() => expandedKey = (key == expandedKey) ? null : key);

  Widget? icon(String route) => switch (route) {
        '/products' => Assets.icons.bagHappy,
        '/stocks' => Assets.icons.layer,
        '/transactions' => Assets.icons.arrowSwapHorizontal,
        '/reports' => Assets.icons.presentionChart,
        '/employees' => Assets.icons.employees,
        '/settings' => Assets.icons.settings,
        _ => null,
      }
          ?.svg(
        colorFilter: (context.isSubrouteOf(route) ? UIColors.primary : UIColors.textRegular).toColorFilter,
      );
}

extension BuildContextExt on BuildContext {
  /// Retrieves the current route's full URI as a string.
  /// This includes the path, query parameters, and fragment (if any).
  String get currentRoute => GoRouterState.of(this).uri.toString();

  /// Returns the base route up to [levels] segments from the current route.
  /// Defaults to 1 level.
  String baseRoute({int levels = 1}) {
    final segments = currentRoute.split('/').where((s) => s.isNotEmpty).toList();
    if (segments.isEmpty) return '/';
    final limitedSegments = segments.take(levels).toList();
    return '/${limitedSegments.join('/')}';
  }

  /// Checks if the current route is a subroute of the given [baseRoute].
  ///
  /// This method splits both routes into segments, then verifies that:
  /// - The current route has at least as many segments as the base route.
  /// - All segments of the base route strictly match the corresponding
  ///   segments of the current route in order.
  ///
  /// Returns `true` if the current route starts with the base route segments,
  /// indicating that it is a subroute. Otherwise, returns `false`.
  bool isSubrouteOf(String baseRoute) {
    final currentSegments = currentRoute.split('/').where((segment) => segment.isNotEmpty).toList();
    final baseSegments = baseRoute.split('/').where((segment) => segment.isNotEmpty).toList();

    // If the current route has fewer segments, it can't be a subroute
    if (currentSegments.length < baseSegments.length) return false;

    // Check each base segment matches the corresponding current route segment
    for (int i = 0; i < baseSegments.length; i++) {
      if (currentSegments[i] != baseSegments[i]) return false;
    }

    return true;
  }

  /// Checks if the current route exactly matches the given [route].
  bool isExactRoute(String route) => currentRoute == route;
}
