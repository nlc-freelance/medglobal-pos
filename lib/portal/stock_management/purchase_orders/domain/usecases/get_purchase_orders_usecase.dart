import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class GetPurchaseOrdersUseCase implements UseCase<PurchaseOrderPaginatedList, GetPurchaseOrdersParams> {
  final PurchaseOrderRepository _repository;

  GetPurchaseOrdersUseCase(this._repository);

  @override
  Future<Either<Failure, PurchaseOrderPaginatedList>> call(GetPurchaseOrdersParams params) =>
      _repository.getPurchaseOrders(
        page: params.page,
        size: params.size,
        status: params.status,
        branchId: params.branchId,
      );
}

class GetPurchaseOrdersParams {
  final int page;
  final int size;
  final StockOrderStatus? status;
  final int? branchId;

  GetPurchaseOrdersParams({required this.page, required this.size, this.status, this.branchId});
}
