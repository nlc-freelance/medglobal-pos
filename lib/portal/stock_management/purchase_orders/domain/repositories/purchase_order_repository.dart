import 'package:medglobal_admin_portal/core/enums/purchase_order_enum.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';

abstract class PurchaseOrderRepository {
  Future<ApiResult<PaginatedList<PurchaseOrder>>> getPurchaseOrders(PageQuery query);
  Future<ApiResult<PurchaseOrder>> getPurchaseOrderById(int id);
  Future<ApiResult<PurchaseOrder>> create(NewPurchaseOrder payload);
  Future<ApiResult<PurchaseOrder>> update({
    required UpdatePurchaseOrder action,
    required int id,
    required PurchaseOrder po,
  });
  // Future<ApiResult<PurchaseOrder>> cancel(int id);
  Future<ApiResult<void>> delete(int id);
}
