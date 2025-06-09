import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/enums/purchase_order_enum.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/api/purchase_order_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/create_purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/update_purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/update_purchase_order_item_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class PurchaseOrderRepositoryImpl implements PurchaseOrderRepository {
  final PurchaseOrderApi _purchaseOrderApi;

  PurchaseOrderRepositoryImpl(this._purchaseOrderApi);

  @override
  Future<Either<Failure, PurchaseOrder>> create(NewPurchaseOrder po) async {
    try {
      final requestDto = CreatePurchaseOrderDto.fromDomain(po);
      final response = await _purchaseOrderApi.create(requestDto);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, PurchaseOrder>> getPurchaseOrderById(int id) async {
    try {
      final response = await _purchaseOrderApi.getPurchaseOrderById(id);
      return Right(response.toDomain());
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
  Future<Either<Failure, PurchaseOrder>> update({
    required UpdatePurchaseOrder action,
    required int id,
    required PurchaseOrder po,
  }) async {
    try {
      final requestDto = switch (action) {
        UpdatePurchaseOrder.save => UpdatePurchaseOrderDto.saveOrShip(
            status: po.status!.label.toLowerCase(),
            purchaseOrderDetails: po.items
                ?.map((item) => UpdatePurchaseOrderItemDto.save(
                      variantId: item.id!,
                      orderedQuantity: item.quantityOrdered,
                      supplierPrice: item.supplierPrice,
                    ))
                .toList(),
            estimatedDateOfArrival: po.estimatedDateOfArrival?.toIso8601String(),
            tax: po.tax,
            discount: po.discount,
            notes: po.notes,
          ),
        UpdatePurchaseOrder.saveAndMarkAsShippedWithNewItems => UpdatePurchaseOrderDto.saveOrShip(
            status: po.status!.label.toLowerCase(),
            purchaseOrderDetails: po.items
                ?.map((item) => UpdatePurchaseOrderItemDto.saveAndMarkAsShippedWithNewItems(
                      variantId: item.id!,
                      orderedQuantity: item.quantityOrdered!,
                      supplierPrice: item.supplierPrice,
                    ))
                .toList(),
            estimatedDateOfArrival: po.estimatedDateOfArrival?.toIso8601String(),
            tax: po.tax,
            discount: po.discount,
            notes: po.notes,
          ),
        UpdatePurchaseOrder.saveAndMarkAsShipped => UpdatePurchaseOrderDto.saveOrShip(
            status: po.status!.label.toLowerCase(),
            purchaseOrderDetails: po.items
                ?.map((item) => UpdatePurchaseOrderItemDto.saveAndMarkAsShipped(
                      id: item.id!,
                      orderedQuantity: item.quantityOrdered!,
                      supplierPrice: item.supplierPrice,
                    ))
                .toList(),
            estimatedDateOfArrival: po.estimatedDateOfArrival?.toIso8601String(),
            tax: po.tax,
            discount: po.discount,
            notes: po.notes,
          ),
        UpdatePurchaseOrder.saveAndReceived => UpdatePurchaseOrderDto.receive(
            status: po.status!.label.toLowerCase(),
            purchaseOrderDetails: po.items
                ?.map((item) => UpdatePurchaseOrderItemDto.saveAndReceived(
                      id: item.id!,
                      receivedQuantity: item.quantityReceived!,
                    ))
                .toList(),
            notes: po.notes,
          ),
        UpdatePurchaseOrder.cancel => const UpdatePurchaseOrderDto.cancel(status: 'cancelled'),
      };

      final response = await _purchaseOrderApi.update(
        id: id,
        dto: requestDto,
      );
      return Right(response.toDomain());
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
