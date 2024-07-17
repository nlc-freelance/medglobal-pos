import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class GetPurchaseOrdersUsecase implements UseCase<PurchaseOrderPaginatedList, GetPurchaseOrdersParams> {
  final PurchaseOrderRepository _repository;

  GetPurchaseOrdersUsecase(this._repository);

  @override
  Future<Either<Failure, PurchaseOrderPaginatedList>> call(GetPurchaseOrdersParams? params) =>
      _repository.getPurchaseOrders(
        page: params?.page,
        status: params?.status,
      );
}

class GetPurchaseOrdersParams {
  final int? page;
  final StockActionStatus? status;

  GetPurchaseOrdersParams({this.page, this.status});
}
