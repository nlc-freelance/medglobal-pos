import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/create_purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/update_purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/response/purchase_order_dto.dart';

// abstract class PurchaseOrderApi {
//   Future<PurchaseOrderPaginatedList> getPurchaseOrders({
//     required int page,
//     required int size,
//     StockOrderStatus? status,
//     int? branchId,
//     String? startDate,
//     String? endDate,
//   });
//   Future<PurchaseOrderDto> getPurchaseOrderById(int id);
//   Future<PurchaseOrderDto> create(NewPurchaseOrder payload);
//   Future<PurchaseOrderDto> update(StockOrderUpdate type, {required int id, required PurchaseOrder purchaseOrder});
//   Future<void> delete(int id);
// }

class PurchaseOrderApi {
  final BaseApiService _api;

  PurchaseOrderApi(this._api);

  Future<PaginatedList<PurchaseOrderDto>> getPurchaseOrders(PageQuery query
      //   {
      //   required int page,
      //   required int size,
      //   StockOrderStatus? status,
      //   int? branchId,
      //   String? startDate,
      //   String? endDate,
      // }
      ) async {
    final response = await _api.getPaginated<PurchaseOrderDto>(
      ApiEndpoints.purchaseOrders,
      queryParams: query.toJson(),
      // {
      //   'page': page,
      //   'size': size,
      //   if (status != null) 'status': status.label.toLowerCase(),
      //   if (branchId != null) 'branch': branchId,
      //   if (startDate != null) 'startDate': startDate,
      //   if (endDate != null) 'endDate': endDate,
      // },
      fromJson: PurchaseOrderDto.fromJson,
    );

    return PaginatedList<PurchaseOrderDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<PurchaseOrderDto> getPurchaseOrderById(int id) async {
    final response = await _api.get<PurchaseOrderDto>(
      '/purchase-orders/$id',
      fromJson: PurchaseOrderDto.fromJson,
    );

    return response.data;
  }

  Future<PurchaseOrderDto> createPurchaseOrder(CreatePurchaseOrderDto dto) async {
    final response = await _api.post<PurchaseOrderDto>(
      ApiEndpoints.purchaseOrders,
      data: dto.toJson(),
      fromJson: PurchaseOrderDto.fromJson,
    );

    return response.data;
  }

  Future<PurchaseOrderDto> updatePurchaseOrder({
    // required StockOrderUpdate type,
    required int id,
    required UpdatePurchaseOrderDto dto,
  }) async {
    // JSON payload = {};
    // if (type == StockOrderUpdate.SAVE) payload = purchaseOrder.toSavePayload();
    // if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED) payload = purchaseOrder.toSaveAndMarkAsShippedPayload();
    // if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
    //   payload = purchaseOrder.toSaveAndMarkAsShippedWithNewItemsPayload();
    // }
    // if (type == StockOrderUpdate.SAVE_AND_RECEIVED) payload = purchaseOrder.toSaveAndReceivedPayload();
    // if (type == StockOrderUpdate.CANCEL) payload = purchaseOrder.toCancelPayload();

    final response = await _api.update<PurchaseOrderDto>(
      ApiEndpoints.purchaseOrderById(id),
      data: dto.toJson(),
      fromJson: PurchaseOrderDto.fromJson,
    );

    return response.data;
  }

  Future<void> delete(int id) async {
    return await _api.delete<PurchaseOrderDto>(ApiEndpoints.purchaseOrderById(id));
  }
}
