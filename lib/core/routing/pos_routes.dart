import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/route_guard.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/pos_scaffold.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/bloc/sale_bloc/sale_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_cubit/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/pos_product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/billing/billing_page.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/pos/register_screen.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_sync_bloc/product_catalog_sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/screens/sales_screen.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/pos_transaction_bloc/pos_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/pos_transaction_list_bloc/pos_transaction_list_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/refund_bloc/refund_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transactions_page.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

final ShellRoute posRoutes = ShellRoute(
  builder: (context, state, child) => RouteGuard(
    allowedRoles: const [UserType.cashier, UserType.supervisor],
    allowedPlatforms: const [PlatformType.desktop],
    child: PosScaffold(
      route: state,
      child: child,
    ),
  ),
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetIt.I<ProductCatalogSyncBloc>()),
            BlocProvider(create: (context) => GetIt.I<ProductCatalogCubit>()),
            BlocProvider(create: (context) => GetIt.I<PosProductSearchCubit>()),
            BlocProvider(create: (context) => OrderBloc()),
            BlocProvider(create: (context) => GetIt.I<SaleBloc>()),
            BlocProvider(create: (context) => PrintReceiptCubit()),
            BlocProvider(create: (context) => GetIt.I<PosTransactionListBloc>()),
            BlocProvider(create: (context) => GetIt.I<PosTransactionBloc>()),
            BlocProvider(create: (context) => GetIt.I<RefundBloc>()),
          ],
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          path: '/pos/register',
          name: 'registerPage',
          pageBuilder: (context, state) => const NoTransitionPage(child: SalesScreen()),
          // redirect: (context, state) {
          //   if (kIsWeb) return '/not-allowed';
          //   return null;
          // },
        ),
        GoRoute(
          path: '/pos/billing',
          name: 'billingPage',
          pageBuilder: (context, state) => const NoTransitionPage(child: BillingPage()),
        ),
        GoRoute(
          path: '/pos/transactions',
          name: 'transactionPage',
          pageBuilder: (context, state) => const NoTransitionPage(child: TransactionsPage()),
        ),
      ],
    ),
  ],
);
