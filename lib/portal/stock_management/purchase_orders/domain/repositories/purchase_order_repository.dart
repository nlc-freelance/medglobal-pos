import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/purchase_order_enum.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';

abstract class PurchaseOrderRepository {
  Future<Either<Failure, PurchaseOrderPaginatedList>> getPurchaseOrders({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  });
  Future<Either<Failure, PurchaseOrder>> getPurchaseOrderById(int id);
  Future<Either<Failure, PurchaseOrder>> create(NewPurchaseOrder payload);
  Future<Either<Failure, PurchaseOrder>> update({
    required UpdatePurchaseOrder action,
    required int id,
    required PurchaseOrder po,
  });
  // Future<Either<Failure, PurchaseOrder>> cancel(int id);
  Future<Either<Failure, void>> delete(int id);
}
