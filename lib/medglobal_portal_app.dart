import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/category/category_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product/product_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_bulk_action/product_bulk_action_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order_list_remote/purchase_order_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/cubit/new_stock_return/new_stock_return_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/cubit/stock_return_list_remote/stock_return_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/cubit/stock_return_remote/stock_return_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/new_stock_take/new_stock_take_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/stock_take_remote/stock_take_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_remote/stock_transfer_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/presentation/cubit/supply_needs/supply_needs_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class MedGlobaPortalApp extends StatelessWidget {
  const MedGlobaPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()..add(const AppInitEvent())),
        BlocProvider(create: (_) => GetIt.I<SidebarCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplierListCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplierCubit>()),
        BlocProvider(create: (_) => GetIt.I<CategoryCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductSelectionCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductBulkActionCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductListCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductFormCubit>()),
        BlocProvider(create: (_) => GetIt.I<VariantFormCubit>()),
        BlocProvider(create: (_) => GetIt.I<VariantFormUiCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplyNeedsCubit>()),
        BlocProvider(create: (_) => GetIt.I<PurchaseOrderListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<PurchaseOrderRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<PurchaseOrderCubit>()),
        BlocProvider(create: (_) => GetIt.I<NewPurchaseOrderCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockReturnListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockReturnRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockReturnCubit>()),
        BlocProvider(create: (_) => GetIt.I<NewStockReturnCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTransferListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTransferRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTransferCubit>()),
        BlocProvider(create: (_) => GetIt.I<NewStockTransferCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTakeListRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTakeRemoteCubit>()),
        BlocProvider(create: (_) => GetIt.I<StockTakeCubit>()),
        BlocProvider(create: (_) => GetIt.I<NewStockTakeCubit>()),
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
