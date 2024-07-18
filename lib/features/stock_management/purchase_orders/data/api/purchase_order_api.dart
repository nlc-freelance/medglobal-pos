import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/data/dto/purchase_order_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_request.dart';

abstract class PurchaseOrderApi {
  Future<PurchaseOrderPaginatedList> getPurchaseOrders({int? page, StockOrderStatus? status});
  Future<PurchaseOrderDto> getPurchaseOrderById(int id);
  Future<PurchaseOrderDto> create(PurchaseOrderRequest payload);
  Future<void> update(StockOrderUpdate type, {required int id, required PurchaseOrder purchaseOrder});
}

class PurchaseOrderApiImpl implements PurchaseOrderApi {
  final ApiService _apiService;

  PurchaseOrderApiImpl(this._apiService);

  @override
  Future<PurchaseOrderPaginatedList> getPurchaseOrders({int? page, StockOrderStatus? status}) async {
    try {
      final response = await _apiService.collection<PurchaseOrderDto>(
        '/purchase-orders',
        queryParams: {'page': page, 'status': status?.label.toLowerCase()},
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
  Future<PurchaseOrderDto> create(PurchaseOrderRequest payload) async {
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
  Future<void> update(StockOrderUpdate type, {required int id, required PurchaseOrder purchaseOrder}) async {
    try {
      JSON payload = {};
      if (type == StockOrderUpdate.SAVE) payload = purchaseOrder.toSavePayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED) payload = purchaseOrder.toSaveAndMarkAsShippedPayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
        payload = purchaseOrder.toSaveAndMarkAsShippedWithNewItemsPayload();
      }
      if (type == StockOrderUpdate.SAVE_AND_RECEIVED) payload = purchaseOrder.toSaveAndReceivedPayload();
      if (type == StockOrderUpdate.CANCEL) payload = purchaseOrder.toCancelPayload();

      await _apiService.update<PurchaseOrderDto>(
        '/purchase-orders/$id',
        data: payload,
        converter: PurchaseOrderDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }
}
