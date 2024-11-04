import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';

abstract class PurchaseOrderApi {
  Future<PurchaseOrderPaginatedList> getPurchaseOrders({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  });
  Future<PurchaseOrderDto> getPurchaseOrderById(int id);
  Future<PurchaseOrderDto> create(NewPurchaseOrder payload);
  Future<PurchaseOrderDto> update(StockOrderUpdate type, {required int id, required PurchaseOrder purchaseOrder});
  Future<void> delete(int id);
}

class PurchaseOrderApiImpl implements PurchaseOrderApi {
  final ApiService _apiService;

  PurchaseOrderApiImpl(this._apiService);

  @override
  Future<PurchaseOrderPaginatedList> getPurchaseOrders({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _apiService.collection<PurchaseOrderDto>(
        '/purchase-orders',
        queryParams: {
          'page': page,
          'size': size,
          if (status != null) 'status': status.label.toLowerCase(),
          if (branchId != null) 'branch': branchId,
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
        converter: PurchaseOrderDto.fromJson,
      );

      return PurchaseOrderPaginatedList(
        purchaseOrders: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PurchaseOrderDto> getPurchaseOrderById(int id) async {
    try {
      return await _apiService.get<PurchaseOrderDto>(
        '/purchase-orders/$id',
        converter: PurchaseOrderDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PurchaseOrderDto> create(NewPurchaseOrder payload) async {
    try {
      return await _apiService.post<PurchaseOrderDto>(
        '/purchase-orders',
        data: payload.toJson(),
        converter: PurchaseOrderDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PurchaseOrderDto> update(StockOrderUpdate type,
      {required int id, required PurchaseOrder purchaseOrder}) async {
    try {
      JSON payload = {};
      if (type == StockOrderUpdate.SAVE) payload = purchaseOrder.toSavePayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED) payload = purchaseOrder.toSaveAndMarkAsShippedPayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
        payload = purchaseOrder.toSaveAndMarkAsShippedWithNewItemsPayload();
      }
      if (type == StockOrderUpdate.SAVE_AND_RECEIVED) payload = purchaseOrder.toSaveAndReceivedPayload();
      if (type == StockOrderUpdate.CANCEL) payload = purchaseOrder.toCancelPayload();

      final response = await _apiService.update<PurchaseOrderDto>(
        '/purchase-orders/$id',
        data: payload,
        converter: PurchaseOrderDto.fromJson,
      );

      return response!;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _apiService.delete<PurchaseOrderDto>('/purchase-orders/$id');
    } catch (_) {
      rethrow;
    }
  }
}
