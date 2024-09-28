import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/sidebar_cubit.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/dio_service.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_api.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_service.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/repositories/auth_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/repositories/auth_repository.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/confirm_first_time_login.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/get_auth_session.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/login.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/logout.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/branches/cubit/branch_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/branches/data/api/branch_api.dart';
import 'package:medglobal_admin_portal/portal/branches/data/repositories/branch_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/repository/branch_repository.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/usecases/get_branches_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/category_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/product_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/repositories/category_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/repositories/product_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/category/add_category_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/category/get_categories_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/bulk_delete_products_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/bulk_update_products_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/create_product_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/delete_product_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/get_product_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/get_products_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/update_product_usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/category/category_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/category/category_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product/product_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_bulk_action/product_bulk_action_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list_search_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/api/purchase_order_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/repositories/purchase_order_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/create_purchase_order_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/delete_purchase_order_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/get_purchase_order_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/get_purchase_orders_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/update_purchase_order_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_remote/purchase_order_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
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
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_takes_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/update_stock_take_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/new_stock_take/new_stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/uncounted_items/uncounted_items_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_remote/stock_take_remote_cubit.dart';
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
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/usecases/create_supplier_usecase.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/usecases/delete_supplier_usecase.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/usecases/get_supplier_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/usecases/get_suppliers_usecase.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/usecases/update_supplier_usecase.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_lazy_list/supplier_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/usecases/get_transaction_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/usecases/get_transactions_usecase.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/data/api/return_api.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/data/repositories/return_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/domain/repositories/return_repository.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/domain/usecases/update_return_transaction_usecase.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/api/pos_products_api.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/api/sale_api.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/repositories/pos_product_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/repositories/sale_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/repositories/pos_product_repository.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/repositories/sale_repository.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/usecases/create_sale_usecase.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/usecases/get_pos_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/api/refund_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/repositories/refund_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/usecases/create_refund_transaction_usecase.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_admin_portal/shared/register/data/api/register_api.dart';
import 'package:medglobal_admin_portal/shared/register/data/api/register_shift_api.dart';
import 'package:medglobal_admin_portal/shared/register/data/repositories/register_repository_impl.dart';
import 'package:medglobal_admin_portal/shared/register/data/repositories/register_shift_repository_impl.dart';
import 'package:medglobal_admin_portal/shared/register/domain/repositories/register_repository.dart';
import 'package:medglobal_admin_portal/shared/register/domain/repositories/register_shift_repository.dart';
import 'package:medglobal_admin_portal/shared/register/domain/usecases/get_registers_usecase.dart';
import 'package:medglobal_admin_portal/shared/register/domain/usecases/register_shift/close_shift_usecase.dart';
import 'package:medglobal_admin_portal/shared/register/domain/usecases/register_shift/open_shift_usecase.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register_lazy_list/register_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/api/transaction_api.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/repositories/transaction_repository.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';

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
    /// Portal
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
    ..registerLazySingleton<StockTakeApi>(() => StockTakeApiImpl(injector()))
    ..registerLazySingleton<TransactionApi>(() => TransactionApiImpl(injector()))
    ..registerLazySingleton<ReturnApi>(() => ReturnApiImpl(injector()))

    /// POS
    ..registerLazySingleton<RegisterShiftApi>(() => RegisterShiftApiImpl(injector()))
    ..registerLazySingleton<RegisterApi>(() => RegisterApiImpl(injector()))
    ..registerLazySingleton<POSProductApi>(() => POSProductApiImpl(injector()))
    ..registerLazySingleton<SaleApi>(() => SaleApiImpl(injector()))
    ..registerLazySingleton<RefundApi>(() => RefundApiImpl(injector()))

    /// Repository
    /// Portal
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(injector()))
    ..registerLazySingleton<SupplierRepository>(() => SupplierRepositoryImpl(injector()))
    ..registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(injector()))
    ..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(injector()))
    ..registerLazySingleton<BranchRepository>(() => BranchRepositoryImpl(injector()))
    ..registerLazySingleton<SupplyNeedsRepository>(() => SupplyNeedsRepositoryImpl(injector()))
    ..registerLazySingleton<PurchaseOrderRepository>(() => PurchaseOrderRepositoryImpl(injector()))
    ..registerLazySingleton<StockReturnRepository>(() => StockReturnRepositoryImpl(injector()))
    ..registerLazySingleton<StockTransferRepository>(() => StockTransferRepositoryImpl(injector()))
    ..registerLazySingleton<StockTakeRepository>(() => StockTakeRepositoryImpl(injector()))
    ..registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(injector()))
    ..registerLazySingleton<ReturnRepository>(() => ReturnRepositoryImpl(injector()))

    /// POS
    ..registerLazySingleton<RegisterShiftRepository>(() => RegisterShiftRepositoryImpl(injector()))
    ..registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(injector()))
    ..registerLazySingleton<POSProductRepository>(() => POSProductRepositoryImpl(injector()))
    ..registerLazySingleton<SaleRepository>(() => SaleRepositoryImpl(injector()))
    ..registerLazySingleton<RefundRepository>(() => RefundRepositoryImpl(injector()))

    /// Usecases
    ///
    /// Portal
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

    /// Branch UseCase
    ..registerLazySingleton(() => GetBranchesUseCase(injector()))

    /// Category UseCase
    ..registerLazySingleton(() => AddCategoryUseCase(injector()))
    ..registerLazySingleton(() => GetCategoriesUseCase(injector()))

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
    ..registerLazySingleton(() => DeletePurchaseOrderUseCase(injector()))

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
    ..registerLazySingleton(() => DeleteStockTransferUseCase(injector()))

    /// Stock Take
    ..registerLazySingleton(() => GetStockTakesUseCase(injector()))
    ..registerLazySingleton(() => GetStockTakeByIdUseCase(injector()))
    ..registerLazySingleton(() => CreateStockTakeUseCase(injector()))
    ..registerLazySingleton(() => UpdateStockTakeUseCase(injector()))

    /// Transactions
    ..registerLazySingleton(() => GetTransactionsUseCase(injector()))
    ..registerLazySingleton(() => GetTransactionByIdUseCase(injector()))
    ..registerLazySingleton(() => UpdateReturnTransactionUseCase(injector()))

    /// POS
    /// Open Close Shift
    ..registerLazySingleton(() => OpenShiftUseCase(injector()))
    ..registerLazySingleton(() => CloseShiftUseCase(injector()))

    ///
    /// Register
    ..registerLazySingleton(() => GetRegistersUseCase(injector()))

    ///
    /// Register Items
    ..registerLazySingleton(() => GetPOSProductsUseCase(injector()))
    ..registerLazySingleton(() => CreateSaleUseCase(injector()))

    ///
    /// Issue Refund
    ..registerLazySingleton(() => CreateRefundTransactionUseCase(injector()))

    /// Bloc
    ..registerFactory(() => AuthBloc(injector(), injector(), injector(), injector()))
    ..registerFactory(() => SidebarCubit())
    ..registerFactory(() => SupplierListCubit(injector()))
    ..registerFactory(() => SupplierListFilterCubit())
    ..registerFactory(() => SupplierCubit(injector(), injector(), injector(), injector()))
    ..registerFactory(() => CategoryCubit(injector()))
    ..registerFactory(() => ProductSelectionCubit())
    ..registerFactory(() => ProductBulkActionCubit(injector(), injector()))
    ..registerFactory(() => ProductListCubit(injector()))
    ..registerFactory(() => ProductListSearchCubit())
    ..registerFactory(() => ProductCubit(injector(), injector(), injector(), injector()))
    ..registerFactory(() => ProductFormCubit())
    ..registerFactory(() => VariantFormCubit())
    ..registerFactory(() => VariantFormUiCubit())
    ..registerFactory(() => SupplyNeedsCubit(injector()))
    ..registerFactory(() => SupplyNeedCubit())
    ..registerFactory(() => PurchaseOrderListRemoteCubit(injector()))
    ..registerFactory(() => PurchaseOrderListFilterCubit())
    ..registerFactory(() => PurchaseOrderRemoteCubit(injector(), injector(), injector(), injector()))
    ..registerFactory(() => PurchaseOrderCubit())
    ..registerFactory(() => NewPurchaseOrderCubit())
    ..registerFactory(() => StockReturnListRemoteCubit(injector()))
    ..registerFactory(() => StockReturnListFilterCubit())
    ..registerFactory(() => StockReturnRemoteCubit(injector(), injector(), injector()))
    ..registerFactory(() => StockReturnCubit())
    ..registerFactory(() => NewStockReturnCubit())
    ..registerFactory(() => StockTransferListRemoteCubit(injector()))
    ..registerFactory(() => StockTransferListFilterCubit())
    ..registerFactory(() => StockTransferRemoteCubit(injector(), injector(), injector(), injector()))
    ..registerFactory(() => StockTransferCubit())
    ..registerFactory(() => NewStockTransferCubit())
    ..registerFactory(() => StockTakeListRemoteCubit(injector()))
    ..registerFactory(() => StockTakeListFilterCubit())
    ..registerFactory(() => StockTakeRemoteCubit(injector(), injector(), injector()))
    ..registerFactory(() => StockTakeCubit())
    ..registerFactory(() => NewStockTakeCubit())
    ..registerFactory(() => UncountedItemsCubit())
    ..registerFactory(() => SaleTransactionListCubit(injector()))
    ..registerFactory(() => TransactionCubit(injector()))
    ..registerFactory(() => ReturnTransactionListCubit(injector()))
    ..registerFactory(() => ReturnCubit())
    ..registerFactory(() => ReturnRemoteCubit(injector()))
    ..registerFactory(() => SaleTransactionListFilterCubit())
    ..registerFactory(() => ReturnTransactionListFilterCubit())
    ..registerFactory(() => CategoryLazyListCubit(injector()))
    ..registerFactory(() => BranchLazyListCubit(injector()))
    ..registerFactory(() => SupplierLazyListCubit(injector()))

    /// POS
    ..registerFactory(() => RegisterLazyListCubit(injector()))
    ..registerFactory(() => RegisterShiftBloc(injector(), injector()))
    ..registerFactory(() => RegisterCubit())
    ..registerFactory(() => POSProductListRemoteCubit(injector()))
    ..registerFactory(() => ProductSearchCubit())
    ..registerFactory(() => OrderCubit())
    ..registerFactory(() => SaleRemoteCubit(injector()))
    ..registerFactory(() => TransactionListByBranchCubit(injector()))
    ..registerFactory(() => RefundCubit())
    ..registerFactory(() => RefundRemoteCubit(injector()))
    ..registerFactory(() => PrintReceiptCubit());
}
