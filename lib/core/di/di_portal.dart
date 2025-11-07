import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/sidebar_cubit.dart';
import 'package:medglobal_admin_portal/core/di/branch_fetcher.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/http_client/http_client.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_api.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_service.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/repositories/auth_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/repositories/auth_repository.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/confirm_first_time_login.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/get_auth_session.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/login.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/logout.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/api/employee_api.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/repositories/employee_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/bloc/employee_bloc/employee_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/category_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/product_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/repositories/category_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/repositories/product_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bulk_bloc/product_bulk_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/data/api/report_api_service.dart';
import 'package:medglobal_admin_portal/portal/reports/data/repositories/report_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/data/api/product_history_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/data/repositories/product_history_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/repositories/product_history_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/usecases/get_product_history_usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/api/product_sales_history_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/repositories/product_sales_history_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/repositories/product_sales_history_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/bloc/product_sales_history_bloc/product_sales_history_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/data/api/sales_per_category_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/data/repositories/sales_per_category_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/repositories/sales_per_category_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/usecases/get_sales_per_category_usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_filter/sales_category_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_group_by/sales_category_groupby_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_period/sales_category_period_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_per_category/sales_per_category_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/data/api/sales_per_shift_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/data/repositories/sales_per_shift_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/repositories/sales_per_shift_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/usecases/get_sales_per_shift_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/usecases/get_sales_per_shift_usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift/sales_per_shift_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift_filter/sales_per_shift_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift_list/sales_per_shift_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/shift_transactions/shift_transaction_page_size_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/shift_transactions/shift_transactions_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/product_history_detail_bloc/product_history_detail_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/report_bloc/report_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/report_manager_cubit/report_manager_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/api/branch_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/repository/branch_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/branch_bloc/branch_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/api/receipt_template_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/repository/receipt_template_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/repository/receipt_template_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/bloc/receipt_template_bloc/receipt_template_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/repository/register_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/api/tax_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/repository/tax_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/repository/tax_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_bloc/tax_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/api/purchase_order_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/repositories/purchase_order_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order_form/new_purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/data/api/stock_return_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/data/repositories/stock_return_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/repositories/stock_return_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/create_stock_return_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/get_stock_return_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/get_stock_returns_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/update_stock_return_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/new_stock_return/new_stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_filter/stock_return_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_remote/stock_return_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_remote/stock_return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/api/stock_take_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/repositories/stock_take_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/create_stock_take_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_take_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_take_items_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_takes_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/update_stock_items_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/update_stock_take_usecase.dart';
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
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/data/api/stock_transfer_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/data/repositories/stock_transfer_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/create_stock_transfer_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/delete_stock_transfer_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/get_stock_transfer_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/get_stock_transfers_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/update_stock_transfer_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_filter/stock_transfer_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_remote/stock_transfer_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/data/api/supply_needs_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/data/repositories/supply_needs_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/repository/supply_needs_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/usecases/get_supply_needs_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/cubit/supply_need/supply_need_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/cubit/supply_needs/supply_needs_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_api.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/api/supplier_api.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/repositories/supplier_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/bloc/supplier_bloc.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_lazy_list/supplier_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/bloc/transaction_bloc.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/api/return_api.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/repositories/return_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/domain/repositories/return_repository.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/domain/usecases/update_return_transaction_usecase.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/transactions/transaction_api.dart';

GetIt inject = GetIt.instance;

void initPortalDependencies() {
  coreDependencies();
  authDependencies();
  supplierDependencies();
  productDependencies();
  stockDependencies();
  settingsDependencies();
  employeeDependencies();
  transactionDependencies();
  reportDependencies();
  oldDependencies();
}

void coreDependencies() {
  inject
    // ..registerSingleton<DioService>(DioService()) // old
    // ..registerSingleton<ApiService>(ApiService(inject())) // old
    ..registerSingleton(HttpClient())
    ..registerSingleton(ApiService(inject<HttpClient>()))
    ..registerFactory(() => SidebarCubit());
}

void authDependencies() {
  inject
    ..registerSingleton<AuthService>(AuthService())
    ..registerLazySingleton<AuthApi>(() => AuthApiImpl(inject()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(inject()))
    ..registerLazySingleton(() => Login(inject()))
    ..registerLazySingleton(() => ConfirmFirstTimeLogin(inject()))
    ..registerLazySingleton(() => GetAuthSession(inject()))
    ..registerLazySingleton(() => Logout(inject()))
    ..registerFactory(
      () => AuthBloc(
        inject<Login>(),
        inject<ConfirmFirstTimeLogin>(),
        inject<GetAuthSession>(),
        inject<Logout>(),
      ),
    );
}

void supplierDependencies() {
  inject
    ..registerLazySingleton<SupplierApi>(
      () => SupplierApi(api: inject<ApiService>()),
    )
    ..registerLazySingleton<SupplierRepository>(
      () => SupplierRepositoryImpl(api: inject<SupplierApi>()),
    )
    ..registerFactory<SupplierBloc>(
      () => SupplierBloc(repository: inject<SupplierRepository>()),
    )
    ..registerFactory<PaginatedListBloc<Supplier>>(
      () => PaginatedListBloc<Supplier>(inject<SupplierRepository>().getSuppliers),
    )
    ..registerFactory<LazyListBloc<Supplier>>(
      () => LazyListBloc<Supplier>(inject<SupplierRepository>().getSuppliers),
    );
}

void productDependencies() {
  inject
    ..registerLazySingleton<CategoryApi>(
      () => CategoryApi(inject<ApiService>()),
    )
    ..registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(api: inject<CategoryApi>()),
    )
    ..registerFactory<CategoryBloc>(
      () => CategoryBloc(inject<CategoryRepository>()),
    )
    ..registerFactory<LazyListBloc<Category>>(
      () => LazyListBloc<Category>(inject<CategoryRepository>().getCategories),
    )
    ..registerLazySingleton<ProductApi>(
      () => ProductApi(inject<ApiService>()),
    )
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(api: inject<ProductApi>()),
    )
    ..registerFactory<PaginatedListBloc<Product>>(
      () => PaginatedListBloc<Product>(inject<ProductRepository>().getProducts),
    )
    ..registerFactory<ProductBloc>(
      () => ProductBloc(inject<ProductRepository>()),
    )
    ..registerFactory<ProductBulkBloc>(
      () => ProductBulkBloc(inject<ProductRepository>()),
    );
}

void stockDependencies() {
  inject

    /// Supply Needs
    ..registerLazySingleton<SupplyNeedsApi>(
      // TODO: Convert to use ApiService
      () => SupplyNeedsApi(api: inject<ApiService>()),
    )
    // TODO: Convert to use BaseRepository
    ..registerLazySingleton<SupplyNeedsRepository>(
      () => SupplyNeedsRepositoryImpl(inject<SupplyNeedsApi>()),
    )
    // TODO: Convert to Bloc and remove usecase and use repository directly
    ..registerFactory<SupplyNeedsCubit>(
      () => SupplyNeedsCubit(inject<GetSupplyNeedsUseCase>()),
    )

    /// Purchase Order
    ..registerLazySingleton<PurchaseOrderApi>(
      () => PurchaseOrderApi(api: inject<ApiService>()),
    )
    ..registerLazySingleton<PurchaseOrderRepository>(
      () => PurchaseOrderRepositoryImpl(api: inject<PurchaseOrderApi>()),
    )
    ..registerFactory<PurchaseOrderBloc>(
      () => PurchaseOrderBloc(inject<PurchaseOrderRepository>()),
    )
    ..registerFactory<PaginatedListBloc<PurchaseOrder>>(
      () => PaginatedListBloc<PurchaseOrder>(inject<PurchaseOrderRepository>().getPurchaseOrders),
    )

    /// Stock Return
    ..registerLazySingleton<StockReturnApi>(
      // TODO: Convert to use ApiService
      () => StockReturnApi(api: inject<ApiService>()),
    )
    // TODO: Convert to use BaseRepository
    ..registerLazySingleton<StockReturnRepository>(
      () => StockReturnRepositoryImpl(inject<StockReturnApi>()),
    )
    // TODO: Convert to Bloc and remove usecase and use repository directly
    ..registerFactory<StockReturnRemoteCubit>(
      () => StockReturnRemoteCubit(
        inject<GetStockReturnByIdUseCase>(),
        inject<CreateStockReturnUseCase>(),
        inject<UpdateStockReturnUseCase>(),
      ),
    )

    /// Stock Take
    ..registerLazySingleton<StockTakeApi>(
      // TODO: Convert to use ApiService
      () => StockTakeApi(api: inject<ApiService>()),
    )
    // TODO: Convert to use BaseRepository
    ..registerLazySingleton<StockTakeRepository>(
      () => StockTakeRepositoryImpl(inject<StockTakeApi>()),
    )
    // TODO: Check Bloc and remove usecase and use repository directly
    ..registerFactory<StockTakeBloc>(
      () => StockTakeBloc(
        inject<CreateStockTakeUseCase>(),
        inject<GetStockTakeByIdUseCase>(),
        inject<UpdateStockTakeUseCase>(),
        inject<GetStockTakeItemsByIdUseCase>(),
      ),
    )

    /// Stock Transfer
    ..registerLazySingleton<StockTransferApi>(
      // TODO: Convert to use ApiService
      () => StockTransferApi(api: inject<ApiService>()),
    )
    // TODO: Convert to use BaseRepository
    ..registerLazySingleton<StockTransferRepository>(
      () => StockTransferRepositoryImpl(inject<StockTransferApi>()),
    )
    // TODO: Convert to Bloc and remove usecase and use repository directly
    ..registerFactory<StockTransferRemoteCubit>(
      () => StockTransferRemoteCubit(
        inject<GetStockTransferByIdUseCase>(),
        inject<CreateStockTransferUseCase>(),
        inject<UpdateStockTransferUseCase>(),
        inject<DeleteStockTransferUseCase>(),
      ),
    );
}

void settingsDependencies() {
  taxDependencies();
  branchDependencies();
  registerDependencies();
  receiptTemplateDependencies();
}

void taxDependencies() {
  inject
    ..registerLazySingleton<TaxApiService>(
      () => TaxApiService(api: inject<ApiService>()),
    )
    ..registerLazySingleton<TaxRepository>(
      () => TaxRepositoryImpl(api: inject<TaxApiService>()),
    )
    ..registerFactory<PaginatedListBloc<Tax>>(
      () => PaginatedListBloc<Tax>(inject<TaxRepository>().getTaxCodes),
    )
    ..registerFactory<LazyListBloc<Tax>>(
      () => LazyListBloc<Tax>(inject<TaxRepository>().getTaxCodes),
    )
    ..registerFactory<TaxBloc>(
      () => TaxBloc(inject<TaxRepository>()),
    );
}

void branchDependencies() {
  inject
    ..registerLazySingleton<BranchApiService>(
      () => BranchApiService(api: inject<ApiService>()),
    )
    ..registerLazySingleton<BranchRepository>(
      () => BranchRepositoryImpl(api: inject<BranchApiService>()),
    )
    ..registerFactory<PaginatedListBloc<Branch>>(
      () => PaginatedListBloc<Branch>(inject<BranchRepository>().getBranches),
    )
    ..registerLazySingleton<LazyListFetcher<Branch>>(
      () => BranchListFetcher(
        inject<BranchRepository>(),
        inject<EmployeeRepository>(),
        inject<AuthRepository>(),
      ),
    )
    ..registerFactory<LazyListBloc<Branch>>(
      () => LazyListBloc<Branch>(inject<LazyListFetcher<Branch>>().call),
    )
    ..registerFactory<LazyListBloc<BranchPartial>>(
      () => LazyListBloc<BranchPartial>(inject<BranchRepository>().getBranchesPartial),
    )
    ..registerFactory<BranchBloc>(
      () => BranchBloc(inject<BranchRepository>(), inject<ReceiptTemplateRepository>()),
    );
}

void registerDependencies() {
  inject
    ..registerLazySingleton<RegisterApiService>(
      () => RegisterApiService(api: inject<ApiService>()),
    )
    ..registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(api: inject<RegisterApiService>()),
    )
    ..registerFactory<LazyListBloc<Register>>(
      () => LazyListBloc<Register>(inject<RegisterRepository>().getRegisters),
    )
    ..registerFactory<PaginatedListBloc<Register>>(
      () => PaginatedListBloc<Register>(inject<RegisterRepository>().getRegisters),
    )
    ..registerFactory<RegisterBloc>(
      () => RegisterBloc(inject<RegisterRepository>()),
    );
}

void receiptTemplateDependencies() {
  inject
    ..registerLazySingleton<ReceiptTemplateApiService>(
      () => ReceiptTemplateApiService(api: inject<ApiService>()),
    )
    ..registerLazySingleton<ReceiptTemplateRepository>(
      () => ReceiptTemplateRepositoryImpl(api: inject<ReceiptTemplateApiService>()),
    )
    ..registerFactory<PaginatedListBloc<ReceiptTemplate>>(
      () => PaginatedListBloc<ReceiptTemplate>(inject<ReceiptTemplateRepository>().getReceiptTemplates),
    )
    ..registerFactory<LazyListBloc<ReceiptTemplate>>(
      () => LazyListBloc<ReceiptTemplate>(inject<ReceiptTemplateRepository>().getReceiptTemplates),
    )
    ..registerFactory<ReceiptTemplateBloc>(
      () => ReceiptTemplateBloc(inject<ReceiptTemplateRepository>()),
    );
}

void employeeDependencies() {
  inject
    ..registerLazySingleton<EmployeeApi>(
      () => EmployeeApi(api: inject<ApiService>()),
    )
    ..registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(api: inject<EmployeeApi>()),
    )
    ..registerFactory<PaginatedListBloc<Employee>>(
      () => PaginatedListBloc<Employee>(inject<EmployeeRepository>().getEmployees),
    )
    ..registerFactory<EmployeeBloc>(
      () => EmployeeBloc(inject<EmployeeRepository>()),
    );
}

void transactionDependencies() {
  inject
    ..registerLazySingleton<TransactionApi>(
      () => TransactionApi(api: inject<ApiService>()),
    )
    ..registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(api: inject<TransactionApi>()),
    )
    ..registerFactory<TransactionBloc>(
      () => TransactionBloc(inject<TransactionRepository>()),
    );
}

void reportDependencies() {
  inject
    ..registerLazySingleton<ReportApiService>(
      () => ReportApiService(api: inject<ApiService>()),
    )
    ..registerLazySingleton<ReportRepository>(
      () => ReportRepositoryImpl(api: inject<ReportApiService>()),
    )
    ..registerLazySingleton<ReportBloc>(
      () => ReportBloc(repository: inject<ReportRepository>()),
    )
    ..registerFactory<ReportManagerCubit>(
      () => ReportManagerCubit(repository: inject<ReportRepository>()),
    )

    /// Product History
    ..registerLazySingleton<ProductHistoryApi>(
      () => ProductHistoryApi(api: inject<ApiService>()),
    )
    ..registerFactory<ProductHistoryDetailBloc>(
      () => ProductHistoryDetailBloc(
        purchaseOrderRepository: inject<PurchaseOrderRepository>(),
        stockReturnRepository: inject<StockReturnRepository>(),
        stockTakeRepository: inject<StockTakeRepository>(),
        stockTransferRepository: inject<StockTransferRepository>(),
        transactionRepository: inject<TransactionRepository>(),
      ),
    )

    /// Product Sales History
    ..registerLazySingleton<ProductSalesHistoryApi>(
      () => ProductSalesHistoryApi(api: inject<ApiService>()),
    )
    ..registerLazySingleton<ProductSalesHistoryRepository>(
      () => ProductSalesHistoryRepositoryImpl(api: inject<ProductSalesHistoryApi>()),
    )
    ..registerFactory<ProductSalesHistoryBloc>(
      () => ProductSalesHistoryBloc(repository: inject<ProductSalesHistoryRepository>()),
    )

    /// Product Performance
    ..registerFactory<ProductPerformanceListBloc>(
      () => ProductPerformanceListBloc(repository: inject<ReportRepository>()),
    )

    /// Sales per Category
    ..registerLazySingleton<SalesPerCategoryApi>(
      () => SalesPerCategoryApi(api: inject<ApiService>()),
    )
    ..registerLazySingleton<SalesPerShiftApi>(
      () => SalesPerShiftApi(api: inject<ApiService>()),
    );
}

void oldDependencies() {
  inject
    ..registerLazySingleton<ProductVariantApi>(() => ProductVariantApi(api: inject<ApiService>()))
    ..registerLazySingleton<ReturnApi>(() => ReturnApi(api: inject<ApiService>()))
    ..registerLazySingleton<ReturnRepository>(() => ReturnRepositoryImpl(inject()))
    ..registerLazySingleton<ProductHistoryRepository>(() => ProductHistoryRepositoryImpl(inject()))
    ..registerLazySingleton<SalesPerCategoryRepository>(() => SalesPerCategoryRepositoryImpl(inject()))
    ..registerLazySingleton<SalesPerShiftRepository>(() => SalesPerShiftRepositoryImpl(inject()))
    ..registerLazySingleton(() => GetSupplyNeedsUseCase(inject()))

    /// Stock Return
    ..registerLazySingleton(() => GetStockReturnsUseCase(inject()))
    ..registerLazySingleton(() => GetStockReturnByIdUseCase(inject()))
    ..registerLazySingleton(() => CreateStockReturnUseCase(inject()))
    ..registerLazySingleton(() => UpdateStockReturnUseCase(inject()))

    /// Stock Transfer
    ..registerLazySingleton(() => GetStockTransfersUseCase(inject()))
    ..registerLazySingleton(() => GetStockTransferByIdUseCase(inject()))
    ..registerLazySingleton(() => CreateStockTransferUseCase(inject()))
    ..registerLazySingleton(() => UpdateStockTransferUseCase(inject()))
    ..registerLazySingleton(() => DeleteStockTransferUseCase(inject()))

    /// Stock Take
    ..registerLazySingleton(() => GetStockTakesUseCase(inject()))
    ..registerLazySingleton(() => GetStockTakeByIdUseCase(inject()))
    ..registerLazySingleton(() => GetStockTakeItemsByIdUseCase(inject()))
    ..registerLazySingleton(() => CreateStockTakeUseCase(inject()))
    ..registerLazySingleton(() => UpdateStockTakeUseCase(inject()))
    ..registerLazySingleton(() => UpdateStockTakeItemsByIdUseCase(inject()))
    ..registerLazySingleton(() => UpdateReturnTransactionUseCase(inject()))

    /// Reports
    ..registerLazySingleton(() => GetProductHistoryUseCase(inject()))
    ..registerLazySingleton(() => GetSalesPerCategoryUseCase(inject()))
    ..registerLazySingleton(() => GetSalesPerShiftUseCase(inject()))
    ..registerLazySingleton(() => GetSalesPerShiftByIdUseCase(inject()))
    ..registerFactory(() => SupplyNeedCubit())
    ..registerFactory(() => PurchaseOrderListFilterCubit())
    ..registerFactory(() => StockReturnListRemoteCubit(inject()))
    ..registerFactory(() => StockReturnListFilterCubit())
    ..registerFactory(() => StockReturnCubit())
    ..registerFactory(() => NewStockReturnCubit())
    ..registerFactory(() => StockTransferListRemoteCubit(inject()))
    ..registerFactory(() => StockTransferListFilterCubit())
    ..registerFactory(() => StockTransferCubit())
    ..registerFactory(() => NewStockTransferCubit())
    ..registerFactory(() => StockTakeListRemoteCubit(inject()))
    // ..registerFactory(() => StockTakeListFilterCubit())
    ..registerFactory(() => UncountedItemsListCubit(inject()))
    ..registerFactory(() => UncountedItemsListFilterCubit())
    ..registerFactory(() => CountedItemsListCubit(inject()))
    ..registerFactory(() => CountedItemsListFilterCubit())
    // ..registerFactory(() => StockTakeCubit())
    ..registerFactory(() => StockTakeItemsCubit(inject()))
    // ..registerFactory(() => NewStockTakeCubit())
    ..registerFactory(() => UncountedItemsDraftCubit())
    ..registerFactory(() => SaleTransactionListCubit(inject()))
    ..registerFactory(() => ReturnTransactionListCubit(inject()))
    ..registerFactory(() => ReturnCubit())
    ..registerFactory(() => ReturnRemoteCubit(inject()))
    ..registerFactory(() => SaleTransactionListFilterCubit())
    ..registerFactory(() => ReturnTransactionListFilterCubit())
    ..registerFactory(() => SupplierLazyListCubit(inject()))
    ..registerFactory(() => ProductHistoryListCubit(inject()))
    // ..registerFactory(() => ProductHistoryListFilterCubit())
    ..registerFactory(() => SalesCategoryFilterCubit())
    ..registerFactory(() => SalesCategoryGroupByCubit())
    ..registerFactory(() => SalesCategoryPeriodCubit())
    ..registerFactory(() => SalesPerCategoryCubit(inject()))
    ..registerFactory(() => SalesPerShiftListCubit(inject()))
    ..registerFactory(() => SalesPerShiftListFilterCubit())
    ..registerFactory(() => SalesPerShiftCubit(inject()))
    ..registerFactory(() => ShiftTransactionsCubit(inject()))
    ..registerFactory(() => ShiftTransactionPageSizeCubit());
}
