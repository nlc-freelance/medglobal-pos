import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/sidebar_cubit.dart';
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
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/product_history_detail_bloc/product_history_detail_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_manager_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list_bloc/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/api/product_sales_history_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/repositories/product_sales_history_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/repositories/product_sales_history_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/bloc/product_sales_history_bloc/product_sales_history_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/api/branch_api.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/repository/branch_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';
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
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list/product_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
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
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/api/receipt_template_api.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/repository/receipt_template_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/repository/receipt_template_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/bloc/receipt_template_bloc/receipt_template_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_api.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/api/tax_api.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/repository/tax_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/repository/tax_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_bloc/tax_bloc.dart';
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
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_list/pos_product_list_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/pos_product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/receipt_config/receipt_config_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/api/refund_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/repositories/refund_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/usecases/create_refund_transaction_usecase.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_shift_api.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/repository/register_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/repository/register_shift_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/api/transaction_api.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/repositories/transaction_repository.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';

/// lazySingleton are only initialized when needed while factory are always initialized

GetIt inject = GetIt.instance;

void initDependencyInjection() {
  initCoreDependencies();
  initAll();
  initTaxDependencies();
  initBranchDependencies();
  initRegisterDependencies();
  initReceiptTemplateDependencies();
  initEmployeeDependencies();
  initReportDependencies();
}

void initCoreDependencies() {
  inject
    ..registerSingleton(DioServiceNew())
    ..registerSingleton(BaseApiService(inject<DioServiceNew>()));
}

void initTaxDependencies() {
  inject
    ..registerLazySingleton<TaxApi>(
      () => TaxApi(inject<BaseApiService>()),
    )
    ..registerLazySingleton<TaxRepository>(
      () => TaxRepositoryImpl(inject<TaxApi>()),
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
    ..registerLazySingleton<BranchApi>(
      () => BranchApi(inject<BaseApiService>()),
    )
    ..registerLazySingleton<BranchRepository>(
      () => BranchRepositoryImpl(inject<BranchApi>()),
    )
    ..registerFactory<PaginatedListBloc<Branch>>(
      () => PaginatedListBloc<Branch>(inject<BranchRepository>().getBranches),
    )
    ..registerFactory<LazyListBloc<Branch>>(
      () => LazyListBloc<Branch>(inject<BranchRepository>().getBranches),
    )
    ..registerFactory<BranchBloc>(
      () => BranchBloc(inject<BranchRepository>(), inject<ReceiptTemplateRepository>()),
    );
}

void initRegisterDependencies() {
  inject
    ..registerLazySingleton<RegisterApi>(
      () => RegisterApi(inject<BaseApiService>()),
    )
    ..registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(inject<RegisterApi>()),
    )
    ..registerFactory<PaginatedListBloc<Register>>(
      () => PaginatedListBloc<Register>(inject<RegisterRepository>().getRegisters),
    )
    ..registerFactory<LazyListBloc<Register>>(
      () => LazyListBloc<Register>(inject<RegisterRepository>().getRegisters),
    )
    ..registerFactory(
      () => RegisterBloc(inject<RegisterRepository>()),
    )
    ..registerLazySingleton<RegisterShiftApi>(
      () => RegisterShiftApiImpl(inject()), // Refactor to use BaseApiService
    )
    ..registerLazySingleton<RegisterShiftRepository>(
      () => RegisterShiftRepositoryImpl(inject<RegisterShiftApi>()),
    )
    ..registerFactory(
      () => RegisterShiftBloc(inject<RegisterShiftRepository>()),
    );
}

void initReceiptTemplateDependencies() {
  inject
    ..registerLazySingleton<ReceiptTemplateApi>(
      () => ReceiptTemplateApi(inject<BaseApiService>()),
    )
    ..registerLazySingleton<ReceiptTemplateRepository>(
      () => ReceiptTemplateRepositoryImpl(inject<ReceiptTemplateApi>()),
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
    // Move to Product dependencies
    ..registerFactory<LazyListBloc<Category>>(
      () => LazyListBloc<Category>(inject<CategoryRepository>().getCategories),
    )
    ..registerFactory<ReportManagerCubit>(
      () => ReportManagerCubit(repository: inject<ReportRepository>()),
    )
    ..registerFactory<ProductPerformanceListBloc>(
      () => ProductPerformanceListBloc(repository: inject<ReportRepository>()),
    )
    ..registerLazySingleton<ProductSalesHistoryApi>(
      () => ProductSalesHistoryApi(api: inject<BaseApiService>()),
    )
    ..registerLazySingleton<ProductSalesHistoryRepository>(
      () => ProductSalesHistoryRepositoryImpl(api: inject<ProductSalesHistoryApi>()),
    )
    ..registerFactory<ProductSalesHistoryBloc>(
      () => ProductSalesHistoryBloc(repository: inject<ProductSalesHistoryRepository>()),
    )
    ..registerFactory<ProductHistoryDetailBloc>(
      () => ProductHistoryDetailBloc(
          purchaseOrderRepository: inject<PurchaseOrderRepository>(),
          stockReturnRepository: inject<StockReturnRepository>(),
          stockTakeRepository: inject<StockTakeRepository>(),
          stockTransferRepository: inject<StockTransferRepository>(),
          transactionRepository: inject<TransactionRepository>()),
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
    ..registerLazySingleton<CategoryApi>(
      () => CategoryApi(inject<BaseApiService>()),
    )
    ..registerLazySingleton<ProductApi>(() => ProductApiImpl(inject()))
    ..registerLazySingleton<ProductVariantApi>(() => ProductVariantApiImpl(inject()))
    ..registerLazySingleton<SupplyNeedsApi>(() => SupplyNeedsApiImpl(inject()))
    ..registerLazySingleton<PurchaseOrderApi>(() => PurchaseOrderApiImpl(inject()))
    ..registerLazySingleton<StockReturnApi>(() => StockReturnApiImpl(inject()))
    ..registerLazySingleton<StockTransferApi>(() => StockTransferApiImpl(inject()))
    ..registerLazySingleton<StockTakeApi>(() => StockTakeApiImpl(inject()))
    ..registerLazySingleton<TransactionApi>(() => TransactionApiImpl(inject()))
    ..registerLazySingleton<ReturnApi>(() => ReturnApiImpl(inject()))
    ..registerLazySingleton<ProductHistoryApi>(() => ProductHistoryApiImpl(inject()))
    // ..registerLazySingleton<ReportsApi>(() => ReportsApiImpl(inject()))
    ..registerLazySingleton<SalesPerCategoryApi>(() => SalesPerCategoryApiImpl(inject()))
    ..registerLazySingleton<SalesPerShiftApi>(() => SalesPerShiftApiImpl(inject()))

    /// POS
    ..registerLazySingleton<POSProductApi>(() => POSProductApiImpl(inject()))
    ..registerLazySingleton<SaleApi>(() => SaleApiImpl(inject()))
    ..registerLazySingleton<RefundApi>(() => RefundApiImpl(inject()))

    /// Repository
    /// Portal
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(inject()))
    ..registerLazySingleton<SupplierRepository>(() => SupplierRepositoryImpl(inject()))
    ..registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(inject()))
    ..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(inject()))
    ..registerLazySingleton<SupplyNeedsRepository>(() => SupplyNeedsRepositoryImpl(inject()))
    ..registerLazySingleton<PurchaseOrderRepository>(() => PurchaseOrderRepositoryImpl(inject()))
    ..registerLazySingleton<StockReturnRepository>(() => StockReturnRepositoryImpl(inject()))
    ..registerLazySingleton<StockTransferRepository>(() => StockTransferRepositoryImpl(inject()))
    ..registerLazySingleton<StockTakeRepository>(() => StockTakeRepositoryImpl(inject()))
    ..registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(inject()))
    ..registerLazySingleton<ReturnRepository>(() => ReturnRepositoryImpl(inject()))
    ..registerLazySingleton<ProductHistoryRepository>(() => ProductHistoryRepositoryImpl(inject()))
    ..registerLazySingleton<SalesPerCategoryRepository>(() => SalesPerCategoryRepositoryImpl(inject()))
    ..registerLazySingleton<SalesPerShiftRepository>(() => SalesPerShiftRepositoryImpl(inject()))

    /// POS

    ..registerLazySingleton<POSProductRepository>(() => POSProductRepositoryImpl(inject()))
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
    ..registerLazySingleton(() => GetSuppliersUseCase(inject()))
    ..registerLazySingleton(() => GetSupplierByIdUseCase(inject()))
    ..registerLazySingleton(() => CreateSupplierUseCase(inject()))
    ..registerLazySingleton(() => UpdateSupplierUseCase(inject()))
    ..registerLazySingleton(() => DeleteSupplierUseCase(inject()))

    /// Category UseCase
    ..registerLazySingleton(() => AddCategoryUseCase(inject()))
    ..registerLazySingleton(() => GetCategoriesUseCase(inject()))

    /// Product UseCase
    ..registerLazySingleton(() => GetProductsUseCase(inject()))
    ..registerLazySingleton(() => BulkUpdateProductsUseCase(inject()))
    ..registerLazySingleton(() => BulkDeleteProductsUseCase(inject()))
    ..registerLazySingleton(() => GetProductByIdUseCase(inject()))
    ..registerLazySingleton(() => CreateProductUseCase(inject()))
    ..registerLazySingleton(() => UpdateProductUseCase(inject()))
    ..registerLazySingleton(() => DeleteProductUseCase(inject()))

    /// Stock Management
    /// Supply Needs
    ..registerLazySingleton(() => GetSupplyNeedsUseCase(inject()))

    /// Purchase Order
    ..registerLazySingleton(() => GetPurchaseOrdersUseCase(inject()))
    ..registerLazySingleton(() => GetPurchaseOrderByIdUseCase(inject()))
    ..registerLazySingleton(() => CreatePurchaseOrderUseCase(inject()))
    ..registerLazySingleton(() => UpdatePurchaseOrderUseCase(inject()))
    ..registerLazySingleton(() => DeletePurchaseOrderUseCase(inject()))

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
    ..registerLazySingleton(() => GetTransactionsUseCase(inject()))
    ..registerLazySingleton(() => GetTransactionByIdUseCase(inject()))
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
    ..registerLazySingleton(() => GetPOSProductsUseCase(inject()))
    ..registerLazySingleton(() => CreateSaleUseCase(inject()))

    ///
    /// Issue Refund
    ..registerLazySingleton(() => CreateRefundTransactionUseCase(inject()))

    /// Bloc
    ..registerFactory(() => AuthBloc(inject(), inject(), inject(), inject()))
    ..registerFactory(() => SidebarCubit())
    ..registerFactory(() => SupplierListCubit(inject()))
    ..registerFactory(() => SupplierListFilterCubit())
    ..registerFactory(() => SupplierCubit(inject(), inject(), inject(), inject()))
    ..registerFactory(() => CategoryCubit(inject()))
    ..registerFactory(() => ProductSelectionCubit())
    ..registerFactory(() => ProductBulkActionCubit(inject(), inject()))
    ..registerFactory(() => ProductListCubit(inject()))
    ..registerFactory(() => ProductListFilterCubit())
    ..registerFactory(() => ProductCubit(inject(), inject(), inject(), inject()))
    ..registerFactory(() => ProductFormCubit())
    ..registerFactory(() => VariantFormCubit())
    ..registerFactory(() => VariantFormUiCubit())
    ..registerFactory(() => SupplyNeedsCubit(inject()))
    ..registerFactory(() => SupplyNeedCubit())
    ..registerFactory(() => PurchaseOrderListRemoteCubit(inject()))
    ..registerFactory(() => PurchaseOrderListFilterCubit())
    ..registerFactory(() => PurchaseOrderRemoteCubit(inject(), inject(), inject(), inject()))
    ..registerFactory(() => PurchaseOrderCubit())
    ..registerFactory(() => NewPurchaseOrderCubit())
    ..registerFactory(() => StockReturnListRemoteCubit(inject()))
    ..registerFactory(() => StockReturnListFilterCubit())
    ..registerFactory(() => StockReturnRemoteCubit(inject(), inject(), inject()))
    ..registerFactory(() => StockReturnCubit())
    ..registerFactory(() => NewStockReturnCubit())
    ..registerFactory(() => StockTransferListRemoteCubit(inject()))
    ..registerFactory(() => StockTransferListFilterCubit())
    ..registerFactory(() => StockTransferRemoteCubit(inject(), inject(), inject(), inject()))
    ..registerFactory(() => StockTransferCubit())
    ..registerFactory(() => NewStockTransferCubit())
    ..registerFactory(() => StockTakeListRemoteCubit(inject()))
    ..registerFactory(() => StockTakeListFilterCubit())
    ..registerFactory(() => StockTakeBloc(inject(), inject(), inject()))
    ..registerFactory(() => UncountedItemsListCubit(inject()))
    ..registerFactory(() => UncountedItemsListFilterCubit())
    ..registerFactory(() => CountedItemsListCubit(inject()))
    ..registerFactory(() => CountedItemsListFilterCubit())
    ..registerFactory(() => StockTakeCubit())
    ..registerFactory(() => StockTakeItemsCubit(inject()))
    ..registerFactory(() => NewStockTakeCubit())
    ..registerFactory(() => UncountedItemsDraftCubit())
    ..registerFactory(() => SaleTransactionListCubit(inject()))
    ..registerFactory(() => TransactionCubit(inject()))
    ..registerFactory(() => ReturnTransactionListCubit(inject()))
    ..registerFactory(() => ReturnCubit())
    ..registerFactory(() => ReturnRemoteCubit(inject()))
    ..registerFactory(() => SaleTransactionListFilterCubit())
    ..registerFactory(() => ReturnTransactionListFilterCubit())
    ..registerFactory(() => CategoryLazyListCubit(inject()))
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

    ..registerFactory(() => PosProductListCubit(inject()))
    ..registerFactory(() => PosProductSearchCubit())
    ..registerFactory(() => OrderCubit())
    ..registerFactory(() => SaleRemoteCubit(inject()))
    ..registerFactory(() => TransactionListByBranchCubit(inject()))
    ..registerFactory(() => RefundCubit())
    ..registerFactory(() => RefundRemoteCubit(inject()))
    ..registerFactory(() => PrintReceiptCubit())
    ..registerFactory(() => ReceiptConfigBloc(inject<BranchRepository>()));
}
