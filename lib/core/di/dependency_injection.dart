import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/sidebar_cubit.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/dio_service.dart';
import 'package:medglobal_admin_portal/features/authentication/data/api/auth_api.dart';
import 'package:medglobal_admin_portal/features/authentication/data/api/auth_service.dart';
import 'package:medglobal_admin_portal/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/repositories/auth_repository.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/usecases/confirm_first_time_login.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/usecases/get_auth_session.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/usecases/login.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/usecases/logout.dart';
import 'package:medglobal_admin_portal/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/features/branches/data/branch_api.dart';
import 'package:medglobal_admin_portal/features/branches/data/branch_repository_impl.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch_repository.dart';
import 'package:medglobal_admin_portal/features/product_management/data/api/category_api.dart';
import 'package:medglobal_admin_portal/features/product_management/data/api/product_api.dart';
import 'package:medglobal_admin_portal/features/product_management/data/repositories/category_repository_impl.dart';
import 'package:medglobal_admin_portal/features/product_management/data/repositories/product_repository_impl.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/repositories/category_repository.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/repositories/product_repository.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/category/add_category_usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/bulk_delete_products_usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/bulk_update_products_usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/create_product_usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/delete_product_usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/get_product_by_id_usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/get_products_usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/update_product_usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/category/category_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product/product_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_bulk_action/product_bulk_action_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/data/api/purchase_order_api.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/data/repositories/purchase_order_repository_impl.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/usecases/create_purchase_order_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/usecases/get_purchase_order_by_id_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/usecases/get_purchase_orders_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/usecases/update_purchase_order_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order_list_remote/purchase_order_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/data/api/stock_return_api.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/data/repositories/stock_return_repository_impl.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/repositories/stock_return_repository.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/usecases/create_stock_return_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/usecases/get_stock_return_by_id_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/usecases/get_stock_returns_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/usecases/update_stock_return_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/cubit/new_stock_return/new_stock_return_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/cubit/stock_return_list_remote/stock_return_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/cubit/stock_return_remote/stock_return_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/data/api/stock_transfer_api.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/data/repositories/stock_transfer_repository_impl.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/usecases/create_stock_transfer_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/usecases/get_stock_transfer_by_id_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/usecases/get_stock_transfers_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/usecases/update_stock_transfer_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_remote/stock_transfer_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/data/api/supply_needs_api.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/data/repositories/supply_needs_repository_impl.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/repository/supply_needs_repository.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/usecases/get_supply_needs_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/presentation/cubit/supply_needs/supply_needs_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/variants/product_variant_api.dart';
import 'package:medglobal_admin_portal/features/supplier_management/data/api/supplier_api.dart';
import 'package:medglobal_admin_portal/features/supplier_management/data/repositories/supplier_repository_impl.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/create_supplier_usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/delete_supplier_usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_supplier_by_id_usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_suppliers_usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/update_supplier_usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';

/// lazySingleton are only initialized when needed while factory are always initialized

GetIt injector = GetIt.instance;

void initDependencyInjection() {
  injector

    /// Dio
    ..registerSingleton<DioService>(DioService())

    /// API Service
    ..registerSingleton<ApiService>(ApiService(injector()))
    ..registerSingleton<AuthService>(AuthService())

    /// API
    ..registerLazySingleton<AuthApi>(() => AuthApiImpl(injector()))
    ..registerLazySingleton<SupplierApi>(() => SupplierApiImpl(injector()))
    ..registerLazySingleton<CategoryApi>(() => CategoryApiImpl(injector()))
    ..registerLazySingleton<ProductApi>(() => ProductApiImpl(injector()))
    ..registerLazySingleton<BranchApi>(() => BranchApiImpl(injector()))
    ..registerLazySingleton<ProductVariantApi>(() => ProductVariantApiImpl(injector()))
    ..registerLazySingleton<SupplyNeedsApi>(() => SupplyNeedsApiImpl(injector()))
    ..registerLazySingleton<PurchaseOrderApi>(() => PurchaseOrderApiImpl(injector()))
    ..registerLazySingleton<StockReturnApi>(() => StockReturnApiImpl(injector()))
    ..registerLazySingleton<StockTransferApi>(() => StockTransferApiImpl(injector()))

    /// Repository
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(injector()))
    ..registerLazySingleton<SupplierRepository>(() => SupplierRepositoryImpl(injector()))
    ..registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(injector()))
    ..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(injector()))
    ..registerLazySingleton<BranchRepository>(() => BranchRepositoryImpl(injector()))
    ..registerLazySingleton<SupplyNeedsRepository>(() => SupplyNeedsRepositoryImpl(injector()))
    ..registerLazySingleton<PurchaseOrderRepository>(() => PurchaseOrderRepositoryImpl(injector()))
    ..registerLazySingleton<StockReturnRepository>(() => StockReturnRepositoryImpl(injector()))
    ..registerLazySingleton<StockTransferRepository>(() => StockTransferRepositoryImpl(injector()))

    /// Usecases
    /// Authentication UseCase
    ..registerLazySingleton(() => Login(injector()))
    ..registerLazySingleton(() => ConfirmFirstTimeLogin(injector()))
    ..registerLazySingleton(() => GetAuthSession(injector()))
    ..registerLazySingleton(() => Logout(injector()))

    /// Supplier UseCase
    ..registerLazySingleton(() => GetSuppliersUseCase(injector()))
    ..registerLazySingleton(() => GetSupplierByIdUseCase(injector()))
    ..registerLazySingleton(() => CreateSupplierUseCase(injector()))
    ..registerLazySingleton(() => UpdateSupplierUseCase(injector()))
    ..registerLazySingleton(() => DeleteSupplierUseCase(injector()))

    /// Category UseCase
    ..registerLazySingleton(() => AddCategoryUseCase(injector()))

    /// Product UseCase
    ..registerLazySingleton(() => GetProductsUseCase(injector()))
    ..registerLazySingleton(() => BulkUpdateProductsUseCase(injector()))
    ..registerLazySingleton(() => BulkDeleteProductsUseCase(injector()))
    ..registerLazySingleton(() => GetProductByIdUseCase(injector()))
    ..registerLazySingleton(() => CreateProductUseCase(injector()))
    ..registerLazySingleton(() => UpdateProductUseCase(injector()))
    ..registerLazySingleton(() => DeleteProductUseCase(injector()))

    /// Stock Management
    /// Supply Needs
    ..registerLazySingleton(() => GetSupplyNeedsUseCase(injector()))

    /// Purchase Order
    ..registerLazySingleton(() => GetPurchaseOrdersUseCase(injector()))
    ..registerLazySingleton(() => GetPurchaseOrderByIdUseCase(injector()))
    ..registerLazySingleton(() => CreatePurchaseOrderUseCase(injector()))
    ..registerLazySingleton(() => UpdatePurchaseOrderUseCase(injector()))

    /// Stock Return
    ..registerLazySingleton(() => GetStockReturnsUseCase(injector()))
    ..registerLazySingleton(() => GetStockReturnByIdUseCase(injector()))
    ..registerLazySingleton(() => CreateStockReturnUseCase(injector()))
    ..registerLazySingleton(() => UpdateStockReturnUseCase(injector()))

    /// Stock Transfer
    ..registerLazySingleton(() => GetStockTransfersUseCase(injector()))
    ..registerLazySingleton(() => GetStockTransferByIdUseCase(injector()))
    ..registerLazySingleton(() => CreateStockTransferUseCase(injector()))
    ..registerLazySingleton(() => UpdateStockTransferUseCase(injector()))

    /// Bloc
    ..registerFactory(() => AuthBloc(injector(), injector(), injector(), injector()))
    ..registerFactory(() => SidebarCubit())
    ..registerFactory(() => SupplierListCubit(injector()))
    ..registerFactory(() => SupplierCubit(injector(), injector(), injector(), injector()))
    ..registerFactory(() => CategoryCubit(injector()))
    ..registerFactory(() => ProductSelectionCubit())
    ..registerFactory(() => ProductBulkActionCubit(injector(), injector()))
    ..registerFactory(() => ProductListCubit(injector()))
    ..registerFactory(() => ProductCubit(injector(), injector(), injector(), injector()))
    ..registerFactory(() => ProductFormCubit())
    ..registerFactory(() => VariantFormCubit())
    ..registerFactory(() => VariantFormUiCubit())
    ..registerFactory(() => SupplyNeedsCubit(injector()))
    ..registerFactory(() => PurchaseOrderListRemoteCubit(injector()))
    ..registerFactory(() => PurchaseOrderRemoteCubit(injector(), injector(), injector()))
    ..registerFactory(() => PurchaseOrderCubit())
    ..registerFactory(() => NewPurchaseOrderCubit())
    ..registerFactory(() => StockReturnListRemoteCubit(injector()))
    ..registerFactory(() => StockReturnRemoteCubit(injector(), injector(), injector()))
    ..registerFactory(() => StockReturnCubit())
    ..registerFactory(() => NewStockReturnCubit())
    ..registerFactory(() => StockTransferListRemoteCubit(injector()))
    ..registerFactory(() => StockTransferRemoteCubit(injector(), injector(), injector()))
    ..registerFactory(() => StockTransferCubit())
    ..registerFactory(() => NewStockTransferCubit());
}
