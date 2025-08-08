import 'dart:io';

import 'package:flutter/foundation.dart' hide Category;
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/sidebar_cubit.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/dio_service.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
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
import 'package:medglobal_admin_portal/portal/employee_management/data/repository/employee_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/bloc/employee_bloc/employee_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/repositories/category_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bulk_bloc/product_bulk_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_bloc/report_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_manager_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list_bloc/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/product_history_detail_bloc/product_history_detail_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/api/branch_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/repository/branch_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/category_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/product_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/repositories/product_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/data/api/report_api_service.dart';
import 'package:medglobal_admin_portal/portal/reports/data/repositories/report_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/data/api/product_history_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/data/repositories/product_history_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/repositories/product_history_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/usecases/get_product_history_usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_filter_cubit.dart';
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
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/branch_bloc/branch_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/api/receipt_template_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/repository/receipt_template_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/repository/receipt_template_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/bloc/receipt_template_bloc/receipt_template_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_api_service.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
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
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
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
import 'package:medglobal_admin_portal/pos/app_session/data/datasources/app_session_datasource.dart';
import 'package:medglobal_admin_portal/pos/app_session/data/repositories/session_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/repository/app_session_repository.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/usecases/initialize_app_session_usecase.dart';
import 'package:medglobal_admin_portal/pos/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/device_register/device_register_bloc.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/api/pos_products_api.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/api/sale_api.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/repositories/pos_product_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/repositories/sale_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/repositories/pos_product_repository.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/repositories/sale_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/repositories/local_product_catalog_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/repositories/remote_product_catalog_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/delta_sync_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/get_product_catalog_usecase.dart';
import 'package:medglobal_admin_portal/pos/sales/data/repositories/local_sale_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/sales/data/repositories/remote_sale_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/local_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/remote_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/usecases/create_sale_usecase.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/usecases/print_receipt_usecase.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/usecases/print_receipt_usecase.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/print_receipt_cubit/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/sale_bloc/sale_bloc.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/initial_fetch_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_cubit/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/pos_product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/receipt_config/receipt_config_bloc.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/datasources/local_product_catalog_datasource.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/datasources/remote_product_catalog_datasource.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/local_product_catalog_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/remote_product_catalog_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_sync_bloc/product_catalog_sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/data/datasources/local_receipt_config_datasource.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/data/datasources/remote_receipt_config_datasource.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/data/repositories/local_receipt_config_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/data/repositories/remote_receipt_config_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/local_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/remote_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/datasources/register_shift_local_datasource.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/datasources/register_shift_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/datasources/register_shift_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/repositories/local_register_shift_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/repositories/remote_register_shift_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/remote_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/check_for_open_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/check_for_open_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/close_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/get_last_closed_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/get_last_closed_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/open_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/sync_queue_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/data/datasources/local_sale_datasource.dart';
import 'package:medglobal_admin_portal/pos/sales/data/datasources/sale_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/app_session/presentation/app_session_bloc.dart';
import 'package:medglobal_admin_portal/pos/sync/network_service.dart';
import 'package:medglobal_admin_portal/pos/sync/sync_bloc/sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/sync/sync_service.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/api/refund_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/repositories/refund_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund_repository.dart';
// import 'package:medglobal_admin_portal/pos/transactions/domain/usecases/create_refund_transaction_usecase.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/pos_transaction_bloc/pos_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/pos_transaction_list_bloc/pos_transaction_list_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/refund_bloc/refund_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_shift_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/repository/register_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/repository/register_shift_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/api/transaction_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transaction_repository.dart';

import '../../pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

/// lazySingleton are only initialized when needed while factory are always initialized

GetIt inject = GetIt.instance;

void initDesktopDependencies() {
  print('setup di on desktop');

  initCoreDependencies();
  initAll();
  initServices();
  initReceiptConfig();
  initSyncingDependencies();
  initLocalDatabaseDependencies();
  initNetworkDependencies();
  initRegisterPOSDependencies();
  initSharedRegisterDependencies();
  initTransactionDependencies();
  initPosDependencies();

  // // Get device assigned register by serial number
  // GetIt.I<DeviceRegisterBloc>().add(const DeviceRegisterEvent.getAssignedRegister());
}

void initDependencyInjection() {
  print('setup di on web');
  initCoreDependencies();
  initAll();

  initProductDependencies();
  initSupplierDependencies();
  initTaxDependencies();
  initBranchDependencies();
  initRegisterPortalDependencies();
  initSharedRegisterDependencies();
  initReceiptTemplateDependencies();
  initEmployeeDependencies();
  initReportDependencies();
  initStockDependencies();
}

void initLocalDatabaseDependencies() {
  inject.registerSingleton<AppDatabase>(AppDatabase());
}

void initServices() {
  inject
    ..registerSingleton<ConnectivityService>(
      ConnectivityService(),
    )
    ..registerLazySingleton<AppSessionService>(
      () => AppSessionService(),
    );
}

void initReceiptConfig() {
  inject
    ..registerLazySingleton<LocalReceiptConfigDataSource>(
      () => LocalReceiptConfigDataSource(dao: inject<AppDatabase>().receiptConfigDao),
    )
    ..registerLazySingleton<RemoteReceiptConfigDataSource>(
      () => RemoteReceiptConfigDataSource(inject<BaseApiService>()),
    )
    ..registerLazySingleton<LocalReceiptConfigRepository>(
      () => LocalReceiptConfigRepositoryImpl(localDataSource: inject<LocalReceiptConfigDataSource>()),
    )
    ..registerLazySingleton<RemoteReceiptConfigRepository>(
      () => RemoteReceiptConfigRepositoryImpl(remoteDataSource: inject<RemoteReceiptConfigDataSource>()),
    )
    ..registerLazySingleton<PrintReceiptUseCase>(
      () => PrintReceiptUseCase(
        remoteReceiptConfigRepository: inject<RemoteReceiptConfigRepository>(),
        localReceiptConfigRepository: inject<LocalReceiptConfigRepository>(),
        appSessionService: inject<AppSessionService>(),
        connection: inject<ConnectivityService>(),
      ),
    )
    ..registerFactory<PrintReceiptCubit>(
      () => PrintReceiptCubit(printReceiptUseCase: inject<PrintReceiptUseCase>()),
    );
}

void initNetworkDependencies() {
  inject
    ..registerLazySingleton<LocalProductCatalogDataSource>(
      () => LocalProductCatalogDataSource(dao: inject<AppDatabase>().productCatalogDao),
    )
    ..registerLazySingleton<RemoteProductCatalogDataSource>(
      () => RemoteProductCatalogDataSource(inject<BaseApiService>()),
    )
    ..registerLazySingleton<SyncService>(
      () => SyncService(
        db: inject<AppDatabase>(),
        connection: inject<ConnectivityService>(),
        productCatalogLocalRepo: inject<LocalProductCatalogRepository>(),
        productCatalogRemoteRepo: inject<RemoteProductCatalogRepository>(),
        receiptConfigLocalRepo: inject<LocalReceiptConfigRepository>(),
        receiptConfigRemoteRepo: inject<RemoteReceiptConfigRepository>(),
        registerShiftLocalRepo: inject<LocalRegisterShiftRepository>(),
        registerShiftRemoteRepo: inject<RemoteRegisterShiftRepository>(),
        saleLocalRepo: inject<LocalSaleRepository>(),
        saleRemoteRepo: inject<RemoteSaleRepository>(),
      ),
    )
    ..registerFactory<SyncBloc>(() => SyncBloc(inject<SyncService>()
        // syncService: inject<SyncService>(),
        // networkService: inject<NetworkService>(),
        ));
}

void initCoreDependencies() {
  inject
    ..registerSingleton(DioServiceNew())
    ..registerSingleton(BaseApiService(inject<DioServiceNew>()));
}

void initSupplierDependencies() {
  inject
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

void initProductDependencies() {
  inject
    ..registerLazySingleton<CategoryApi>(
      () => CategoryApi(inject<BaseApiService>()),
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
      () => ProductApi(inject<BaseApiService>()),
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

void initTaxDependencies() {
  inject
    ..registerLazySingleton<TaxApiService>(
      () => TaxApiService(inject<BaseApiService>()),
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

void initBranchDependencies() {
  inject
    ..registerLazySingleton<BranchApiService>(
      () => BranchApiService(inject<BaseApiService>()),
    )
    ..registerLazySingleton<BranchRepository>(
      () => BranchRepositoryImpl(api: inject<BranchApiService>()),
    )
    ..registerFactory<PaginatedListBloc<Branch>>(
      () => PaginatedListBloc<Branch>(inject<BranchRepository>().getBranches),
    )
    ..registerFactory<LazyListBloc<Branch>>(
      () => LazyListBloc<Branch>(inject<BranchRepository>().getBranches),
    )
    ..registerFactory<LazyListBloc<BranchPartial>>(
      () => LazyListBloc<BranchPartial>(inject<BranchRepository>().getBranchesPartial),
    )
    ..registerFactory<BranchBloc>(
      () => BranchBloc(inject<BranchRepository>(), inject<ReceiptTemplateRepository>()),
    );
}

void initSharedRegisterDependencies() {
  inject
    ..registerLazySingleton<RegisterApiService>(
      () => RegisterApiService(inject<BaseApiService>()),
    )
    ..registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(api: inject<RegisterApiService>()),
    )
    ..registerFactory<LazyListBloc<Register>>(
      () => LazyListBloc<Register>(inject<RegisterRepository>().getRegisters),
    );
}

void initRegisterPortalDependencies() {
  inject
    ..registerFactory<PaginatedListBloc<Register>>(
      () => PaginatedListBloc<Register>(inject<RegisterRepository>().getRegisters),
    )
    ..registerFactory<RegisterBloc>(
      () => RegisterBloc(inject<RegisterRepository>()),
    );
}

void initSyncingDependencies() {
  inject
    ..registerFactory<ConnectivityCubit>(
      () => ConnectivityCubit(service: inject<ConnectivityService>()),
    )
    ..registerLazySingleton<SyncQueueRepository>(
      () => SyncQueueRepository(
        dao: inject<AppDatabase>().syncQueueDao,
        session: inject<AppSessionService>(),
      ),
    );
}

void initRegisterPOSDependencies() {
  inject

    /// Session
    ..registerLazySingleton<AppSessionDataSource>(
      () => AppSessionDataSource(dao: inject<AppDatabase>().sessionDao),
    )
    ..registerLazySingleton<AppSessionRepository>(
      () => AppSessionRepositoryImpl(localDataSource: inject<AppSessionDataSource>()),
    )
    ..registerLazySingleton<InitializeAppSessionUseCase>(
      () => InitializeAppSessionUseCase(
        registerRepository: inject<RegisterRepository>(),
        remoteReceiptConfigRepository: inject<RemoteReceiptConfigRepository>(),
        localReceiptConfigRepository: inject<LocalReceiptConfigRepository>(),
        appSessionRepository: inject<AppSessionRepository>(),
        appSessionService: inject<AppSessionService>(),
      ),
    )
    ..registerFactory<AppSessionBloc>(
      () => AppSessionBloc(
        initializeAppSessionUseCase: inject<InitializeAppSessionUseCase>(),
      ),
    )

    ///

    ..registerLazySingleton<RegisterShiftLocalDataSource>(
      () => RegisterShiftLocalDataSource(dao: inject<AppDatabase>().registerShiftDao),
    )
    ..registerLazySingleton<RegisterShiftRemoteDataSource>(
      () => RegisterShiftRemoteDataSource(inject<BaseApiService>()),
    )
    ..registerLazySingleton<LocalRegisterShiftRepository>(
      () => LocalRegisterShiftRepositoryImpl(dataSource: inject<RegisterShiftLocalDataSource>()),
    )
    ..registerLazySingleton<RemoteRegisterShiftRepository>(
      () => RemoteRegisterShiftRepositoryImpl(dataSource: inject<RegisterShiftRemoteDataSource>()),
    )
    ..registerLazySingleton<OpenRegisterShiftUseCase>(
      () => OpenRegisterShiftUseCase(
        local: inject<LocalRegisterShiftRepository>(),
        remote: inject<RemoteRegisterShiftRepository>(),
        session: inject<AppSessionService>(),
        connection: inject<ConnectivityService>(),
        sync: inject<SyncQueueRepository>(),
      ),
    )
    ..registerLazySingleton<CheckForOpenRegisterShiftUseCase>(
      () => CheckForOpenRegisterShiftUseCase(
        local: inject<LocalRegisterShiftRepository>(),
        session: inject<AppSessionService>(),
      ),
    )
    ..registerLazySingleton<GetLastClosedRegisterShiftUseCase>(
      () => GetLastClosedRegisterShiftUseCase(
        local: inject<LocalRegisterShiftRepository>(),
        session: inject<AppSessionService>(),
      ),
    )
    ..registerLazySingleton<CloseRegisterShiftUseCase>(
      () => CloseRegisterShiftUseCase(
        local: inject<LocalRegisterShiftRepository>(),
        remote: inject<RemoteRegisterShiftRepository>(),
        session: inject<AppSessionService>(),
        connection: inject<ConnectivityService>(),
        sync: inject<SyncQueueRepository>(),
      ),
    )
    ..registerFactory<RegisterShiftBloc>(
      () => RegisterShiftBloc(
        openRegisterShiftUseCase: inject<OpenRegisterShiftUseCase>(),
        checkForOpenRegisterShiftUseCase: inject<CheckForOpenRegisterShiftUseCase>(),
        getLastClosedRegisterShiftUseCase: inject<GetLastClosedRegisterShiftUseCase>(),
        closeRegisterShiftUseCase: inject<CloseRegisterShiftUseCase>(),
      ),
    );
}

void initReceiptTemplateDependencies() {
  inject
    ..registerLazySingleton<ReceiptTemplateApiService>(
      () => ReceiptTemplateApiService(inject<BaseApiService>()),
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

void initEmployeeDependencies() {
  inject
    ..registerLazySingleton<EmployeeApi>(
      () => EmployeeApi(inject<BaseApiService>()),
    )
    ..registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(inject<EmployeeApi>()),
    )
    ..registerFactory<PaginatedListBloc<Employee>>(
      () => PaginatedListBloc<Employee>(inject<EmployeeRepository>().getEmployees),
    )
    ..registerFactory<EmployeeBloc>(
      () => EmployeeBloc(inject<EmployeeRepository>()),
    );
}

void initReportDependencies() {
  inject
    ..registerLazySingleton<ReportApiService>(
      () => ReportApiService(api: inject<BaseApiService>()),
    )
    ..registerLazySingleton<ReportRepository>(
      () => ReportRepositoryImpl(api: inject<ReportApiService>()),
    )
    ..registerFactory<ReportManagerCubit>(
      () => ReportManagerCubit(repository: inject<ReportRepository>()),
    )
    ..registerFactory<ProductPerformanceListBloc>(
      () => ProductPerformanceListBloc(repository: inject<ReportRepository>()),
    )
    ..registerLazySingleton<ReportBloc>(
      () => ReportBloc(repository: inject<ReportRepository>()),
    )
    ..registerLazySingleton<ProductHistoryDetailBloc>(
      () => ProductHistoryDetailBloc(
        purchaseOrderRepository: inject<PurchaseOrderRepository>(),
        stockReturnRepository: inject<StockReturnRepository>(),
        stockTakeRepository: inject<StockTakeRepository>(),
        stockTransferRepository: inject<StockTransferRepository>(),
        transactionRepository: inject<TransactionRepository>(),
      ),
    );
}

void initStockDependencies() {
  inject

    /// Supply Needs
    ..registerLazySingleton<SupplyNeedsApi>(
      // TODO: Convert to use BaseApiService
      () => SupplyNeedsApi(inject<ApiService>()),
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
      () => PurchaseOrderApi(inject<BaseApiService>()),
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
      // TODO: Convert to use BaseApiService
      () => StockReturnApi(inject<ApiService>()),
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
      // TODO: Convert to use BaseApiService
      () => StockTakeApi(inject<ApiService>()),
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
      ),
    )

    /// Stock Transfer
    ..registerLazySingleton<StockTransferApi>(
      // TODO: Convert to use BaseApiService
      () => StockTransferApi(inject<ApiService>()),
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

/// POS Dependencies
///
void initTransactionDependencies() {
  inject
    ..registerLazySingleton<TransactionApi>(
      () => TransactionApi(inject<BaseApiService>()),
    )
    ..registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(api: inject<TransactionApi>()),
    )
    ..registerFactory<TransactionBloc>(
      () => TransactionBloc(inject<TransactionRepository>()),
    );
}

void initPosDependencies() {
  inject
    ..registerFactory<PosTransactionListBloc>(
      () => PosTransactionListBloc(inject<TransactionRepository>()),
    )
    ..registerFactory<PosTransactionBloc>(
      () => PosTransactionBloc(inject<TransactionRepository>()),
    )
    ..registerLazySingleton<LocalProductCatalogRepository>(
      () => LocalProductCatalogRepositoryImpl(localDataSource: inject<LocalProductCatalogDataSource>()),
    )
    ..registerLazySingleton<RemoteProductCatalogRepository>(
      () => RemoteProductCatalogRepositoryImpl(remoteDataSource: inject<RemoteProductCatalogDataSource>()),
    )
    ..registerLazySingleton<InitialFetchProductsUseCase>(
      () => InitialFetchProductsUseCase(
        local: inject<LocalProductCatalogRepository>(),
        remote: inject<RemoteProductCatalogRepository>(),
        session: inject<AppSessionService>(),
        syncMetaDataDao: inject<AppDatabase>().syncMetadataDao,
      ),
    )
    ..registerLazySingleton<DeltaSyncProductsUseCase>(
      () => DeltaSyncProductsUseCase(
        local: inject<LocalProductCatalogRepository>(),
        remote: inject<RemoteProductCatalogRepository>(),
        session: inject<AppSessionService>(),
        syncMetaDataDao: inject<AppDatabase>().syncMetadataDao,
      ),
    )
    ..registerLazySingleton<GetProductCatalogUseCase>(
      () => GetProductCatalogUseCase(local: inject<LocalProductCatalogRepository>()),
    )
    ..registerFactory<ProductCatalogCubit>(
      () => ProductCatalogCubit(getProductCatalogUseCase: inject<GetProductCatalogUseCase>()),
    )
    ..registerFactory<ProductCatalogSyncBloc>(
      () => ProductCatalogSyncBloc(
        initialFetchProductsUseCase: inject<InitialFetchProductsUseCase>(),
        deltaSyncProductsUseCase: inject<DeltaSyncProductsUseCase>(),
      ),
    )

    /// Sale
    ..registerLazySingleton<LocalSaleDataSource>(
      () => LocalSaleDataSource(dao: inject<AppDatabase>().transactionDao),
    )
    ..registerLazySingleton<RemoteSaleDataSource>(
      () => RemoteSaleDataSource(inject<BaseApiService>()),
    )
    ..registerLazySingleton<LocalSaleRepository>(
      () => LocalSaleRepositoryImpl(localDataSource: inject<LocalSaleDataSource>()),
    )
    ..registerLazySingleton<RemoteSaleRepository>(
      () => RemoteSaleRepositoryImpl(remoteDataSource: inject<RemoteSaleDataSource>()),
    )
    ..registerLazySingleton<CreateSaleUseCase>(
      () => CreateSaleUseCase(
        localRegisterShiftRepository: inject<LocalRegisterShiftRepository>(),
        local: inject<LocalSaleRepository>(),
        remote: inject<RemoteSaleRepository>(),
        sync: inject<SyncQueueRepository>(),
        appSessionService: inject<AppSessionService>(),
        connection: inject<ConnectivityService>(),
      ),
    )
    ..registerFactory<SaleBloc>(
      () => SaleBloc(
        createSaleUseCase: inject<CreateSaleUseCase>(),
      ),
    )
    ..registerFactory<RefundBloc>(
      () => RefundBloc(inject<RefundRepository>()),
    );
}

// TODO: Break down into smaller init methods
void initAll() {
  inject

        /// Dio
        ..registerSingleton<DioService>(DioService())

        /// API Service
        ..registerSingleton<ApiService>(ApiService(inject()))
        ..registerSingleton<AuthService>(AuthService())

        /// API
        /// Portal
        ..registerLazySingleton<AuthApi>(() => AuthApiImpl(inject()))
        ..registerLazySingleton<SupplierApi>(
          () => SupplierApi(inject<BaseApiService>()),
        )
        // ..registerLazySingleton<SupplierApi>(() => SupplierApiImpl(inject()))
        // ..registerLazySingleton<CategoryApi>(() => CategoryApiImpl(inject()))
        // ..registerLazySingleton<ProductApi>(() => ProductApiImpl(inject()))
        ..registerLazySingleton<ProductVariantApi>(() => ProductVariantApiImpl(inject()))
        // ..registerLazySingleton<SupplyNeedsApi>(() => SupplyNeedsApiImpl(inject()))
        // ..registerLazySingleton<PurchaseOrderApi>(() => PurchaseOrderApiImpl(inject()))
        // ..registerLazySingleton<PurchaseOrderApi>(() => PurchaseOrderApi(inject<ApiService>()))
        // ..registerLazySingleton<StockReturnApi>(() => StockReturnApiImpl(inject()))
        // ..registerLazySingleton<StockTransferApi>(() => StockTransferApiImpl(inject()))
        // ..registerLazySingleton<StockTakeApi>(() => StockTakeApiImpl(inject()))
        // ..registerLazySingleton<TransactionApi>(() => TransactionApiImpl(inject()))
        ..registerLazySingleton<ReturnApi>(() => ReturnApiImpl(inject()))
        ..registerLazySingleton<ProductHistoryApi>(() => ProductHistoryApiImpl(inject()))
        // ..registerLazySingleton<ReportsApi>(() => ReportsApiImpl(inject()))
        ..registerLazySingleton<SalesPerCategoryApi>(() => SalesPerCategoryApiImpl(inject()))
        ..registerLazySingleton<SalesPerShiftApi>(() => SalesPerShiftApiImpl(inject()))

        /// POS
        // ..registerLazySingleton<POSProductApi>(() => POSProductApiImpl(inject()))
        ..registerLazySingleton<SaleApi>(() => SaleApiImpl(inject()))
        ..registerLazySingleton<RefundApi>(() => RefundApiImpl(inject()))

        /// Repository
        /// Portal
        ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(inject()))
        // ..registerLazySingleton<SupplierRepository>(() => SupplierRepositoryImpl(inject()))
        // ..registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(inject()))
        // ..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(inject()))
        // ..registerLazySingleton<SupplyNeedsRepository>(() => SupplyNeedsRepositoryImpl(inject()))
        // ..registerLazySingleton<PurchaseOrderRepository>(() => PurchaseOrderRepositoryImpl(inject()))
        // ..registerLazySingleton<StockReturnRepository>(() => StockReturnRepositoryImpl(inject()))
        // ..registerLazySingleton<StockTransferRepository>(() => StockTransferRepositoryImpl(inject()))
        // ..registerLazySingleton<StockTakeRepository>(() => StockTakeRepositoryImpl(inject()))
        // ..registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(inject()))
        ..registerLazySingleton<ReturnRepository>(() => ReturnRepositoryImpl(inject()))
        ..registerLazySingleton<ProductHistoryRepository>(() => ProductHistoryRepositoryImpl(inject()))
        ..registerLazySingleton<SalesPerCategoryRepository>(() => SalesPerCategoryRepositoryImpl(inject()))
        ..registerLazySingleton<SalesPerShiftRepository>(() => SalesPerShiftRepositoryImpl(inject()))

        /// POS

        // ..registerLazySingleton<POSProductRepository>(() => POSProductRepositoryImpl(inject()))
        ..registerLazySingleton<SaleRepository>(() => SaleRepositoryImpl(inject()))
        ..registerLazySingleton<RefundRepository>(() => RefundRepositoryImpl(inject()))

        /// Usecases
        ///
        /// Portal
        /// Authentication UseCase
        ..registerLazySingleton(() => Login(inject()))
        ..registerLazySingleton(() => ConfirmFirstTimeLogin(inject()))
        ..registerLazySingleton(() => GetAuthSession(inject()))
        ..registerLazySingleton(() => Logout(inject()))

        /// Supplier UseCase
        // ..registerLazySingleton(() => GetSuppliersUseCase(inject()))
        // ..registerLazySingleton(() => GetSupplierByIdUseCase(inject()))
        // ..registerLazySingleton(() => CreateSupplierUseCase(inject()))
        // ..registerLazySingleton(() => UpdateSupplierUseCase(inject()))
        // ..registerLazySingleton(() => DeleteSupplierUseCase(inject()))

        /// Category UseCase
        // ..registerLazySingleton(() => AddCategoryUseCase(inject()))
        // ..registerLazySingleton(() => GetCategoriesUseCase(inject()))

        /// Product UseCase
        // ..registerLazySingleton(() => GetProductsUseCase(inject()))
        // ..registerLazySingleton(() => BulkUpdateProductsUseCase(inject()))
        // ..registerLazySingleton(() => BulkDeleteProductsUseCase(inject()))
        // ..registerLazySingleton(() => GetProductByIdUseCase(inject()))
        // ..registerLazySingleton(() => CreateProductUseCase(inject()))
        // ..registerLazySingleton(() => UpdateProductUseCase(inject()))
        // ..registerLazySingleton(() => DeleteProductUseCase(inject()))

        /// Stock Management
        /// Supply Needs
        ..registerLazySingleton(() => GetSupplyNeedsUseCase(inject()))

        /// Purchase Order
        // ..registerLazySingleton(() => GetPurchaseOrdersUseCase(inject()))
        // ..registerLazySingleton(() => GetPurchaseOrderByIdUseCase(inject()))
        // ..registerLazySingleton(() => CreatePurchaseOrderUseCase(inject()))
        // ..registerLazySingleton(() => UpdatePurchaseOrderUseCase(inject()))
        // ..registerLazySingleton(() => DeletePurchaseOrderUseCase(inject()))

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

        /// Transactions
        // ..registerLazySingleton(() => GetTransactionsUseCase(inject()))
        // ..registerLazySingleton(() => GetTransactionByIdUseCase(inject()))
        ..registerLazySingleton(() => UpdateReturnTransactionUseCase(inject()))

        /// Reports
        ..registerLazySingleton(() => GetProductHistoryUseCase(inject()))
        // ..registerLazySingleton(() => GetReportByIdUseCase(inject()))
        // ..registerLazySingleton(() => CreateReportUseCase(inject()))
        ..registerLazySingleton(() => GetSalesPerCategoryUseCase(inject()))
        ..registerLazySingleton(() => GetSalesPerShiftUseCase(inject()))
        ..registerLazySingleton(() => GetSalesPerShiftByIdUseCase(inject()))

        /// POS
        /// Open Close Shift
        // ..registerLazySingleton(() => OpenShiftUseCase(inject()))
        // ..registerLazySingleton(() => CloseShiftUseCase(inject()))

        ///
        /// Register Items
        // ..registerLazySingleton(() => GetProductCatalogUseCase(inject()))
        // ..registerLazySingleton(() => CreateSaleUseCase(inject()))

        ///
        /// Issue Refund
        // ..registerLazySingleton(() => CreateRefundTransactionUseCase(inject()))

        /// Bloc
        ..registerFactory(() => AuthBloc(inject(), inject(), inject(), inject()))
        ..registerFactory(() => SidebarCubit())
        // ..registerFactory(() => SupplierListCubit(inject()))
        // ..registerFactory(() => SupplierListFilterCubit())
        // ..registerFactory(() => SupplierCubit(inject(), inject(), inject(), inject()))
        // ..registerFactory(() => CategoryCubit(inject()))
        // ..registerFactory(() => ProductSelectionCubit())
        // ..registerFactory(() => ProductBulkActionCubit(inject(), inject()))
        // ..registerFactory(() => ProductListCubit(inject()))
        // ..registerFactory(() => ProductListFilterCubit())
        // ..registerFactory(() => ProductCubit(inject(), inject(), inject(), inject()))
        // ..registerFactory(() => ProductFormCubit())
        // ..registerFactory(() => VariantFormCubit())
        // ..registerFactory(() => VariantFormUiCubit())
        // ..registerFactory(() => SupplyNeedsCubit(inject()))
        ..registerFactory(() => SupplyNeedCubit())
        // ..registerFactory(() => PurchaseOrderListRemoteCubit(inject()))
        ..registerFactory(() => PurchaseOrderListFilterCubit())
        // ..registerFactory(() => PurchaseOrderRemoteCubit(inject(), inject(), inject(), inject()))
        // ..registerFactory(() => PurchaseOrderCubit())
        ..registerFactory(() => NewPurchaseOrderCubit())
        ..registerFactory(() => StockReturnListRemoteCubit(inject()))
        ..registerFactory(() => StockReturnListFilterCubit())
        // ..registerFactory(() => StockReturnRemoteCubit(inject(), inject(), inject()))
        ..registerFactory(() => StockReturnCubit())
        ..registerFactory(() => NewStockReturnCubit())
        ..registerFactory(() => StockTransferListRemoteCubit(inject()))
        ..registerFactory(() => StockTransferListFilterCubit())
        // ..registerFactory(() => StockTransferRemoteCubit(inject(), inject(), inject(), inject()))
        ..registerFactory(() => StockTransferCubit())
        ..registerFactory(() => NewStockTransferCubit())
        ..registerFactory(() => StockTakeListRemoteCubit(inject()))
        ..registerFactory(() => StockTakeListFilterCubit())
        // ..registerFactory(() => StockTakeBloc(inject(), inject(), inject()))
        ..registerFactory(() => UncountedItemsListCubit(inject()))
        ..registerFactory(() => UncountedItemsListFilterCubit())
        ..registerFactory(() => CountedItemsListCubit(inject()))
        ..registerFactory(() => CountedItemsListFilterCubit())
        ..registerFactory(() => StockTakeCubit())
        ..registerFactory(() => StockTakeItemsCubit(inject()))
        ..registerFactory(() => NewStockTakeCubit())
        ..registerFactory(() => UncountedItemsDraftCubit())
        ..registerFactory(() => SaleTransactionListCubit(inject()))
        // ..registerFactory(() => TransactionCubit(inject()))
        ..registerFactory(() => ReturnTransactionListCubit(inject()))
        ..registerFactory(() => ReturnCubit())
        ..registerFactory(() => ReturnRemoteCubit(inject()))
        ..registerFactory(() => SaleTransactionListFilterCubit())
        ..registerFactory(() => ReturnTransactionListFilterCubit())
        // ..registerFactory(() => CategoryLazyListCubit(inject()))
        // ..registerFactory(() => BranchLazyListCubit(inject()))
        ..registerFactory(() => SupplierLazyListCubit(inject()))
        ..registerFactory(() => ProductHistoryListCubit(inject()))
        ..registerFactory(() => ProductHistoryListFilterCubit())
        // ..registerFactory(() => ReportBloc(inject<ReportRepository>())) //
        // ..registerFactory(() => ReportsBloc(inject(), inject()))
        ..registerFactory(() => SalesCategoryFilterCubit())
        ..registerFactory(() => SalesCategoryGroupByCubit())
        ..registerFactory(() => SalesCategoryPeriodCubit())
        ..registerFactory(() => SalesPerCategoryCubit(inject()))
        ..registerFactory(() => SalesPerShiftListCubit(inject()))
        ..registerFactory(() => SalesPerShiftListFilterCubit())
        ..registerFactory(() => SalesPerShiftCubit(inject()))
        ..registerFactory(() => ShiftTransactionsCubit(inject()))
        ..registerFactory(() => ShiftTransactionPageSizeCubit())

        /// POS

        // ..registerFactory(() => ProductCatalogCubit(inject()))
        ..registerFactory(() => PosProductSearchCubit())
      // ..registerFactory(() => OrderCubit())
      // ..registerFactory(() => SaleRemoteCubit(inject()))
      // ..registerFactory(() => TransactionListByBranchCubit(inject()))
      // ..registerFactory(() => RefundCubit())
      // ..registerFactory(() => RefundRemoteCubit(inject()))
      // ..registerFactory(() => PrintReceiptCubit())
      // ..registerFactory(() => ReceiptConfigurationBloc(inject<BranchRepository>()))
      ;
}
