import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/api/purchase_order_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class PurchaseOrderRepositoryImpl implements PurchaseOrderRepository {
  final PurchaseOrderApi _purchaseOrderApi;

  PurchaseOrderRepositoryImpl(this._purchaseOrderApi);

  @override
  Future<Either<Failure, PurchaseOrder>> create(NewPurchaseOrder payload) async {
    try {
      final response = await _purchaseOrderApi.create(payload);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, PurchaseOrder>> getPurchaseOrderById(int id) async {
    try {
      final response = await _purchaseOrderApi.getPurchaseOrderById(id);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, PurchaseOrderPaginatedList>> getPurchaseOrders({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _purchaseOrderApi.getPurchaseOrders(
        page: page,
        size: size,
        status: status,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, PurchaseOrder>> update(StockOrderUpdate type,
      {required int id, required PurchaseOrder purchaseOrder}) async {
    try {
      final response = await _purchaseOrderApi.update(type, id: id, purchaseOrder: purchaseOrder);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      return Right(await _purchaseOrderApi.delete(id));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
