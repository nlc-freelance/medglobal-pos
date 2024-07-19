import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';

abstract class PurchaseOrderRepository {
  Future<Either<Failure, PurchaseOrderPaginatedList>> getPurchaseOrders({int? page, StockOrderStatus? status});
  Future<Either<Failure, PurchaseOrder>> getPurchaseOrderById(int id);
  Future<Either<Failure, PurchaseOrder>> create(NewPurchaseOrder payload);
  Future<Either<Failure, void>> update(StockOrderUpdate type, {required int id, required PurchaseOrder purchaseOrder});
}
