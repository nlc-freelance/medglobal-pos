import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/create_purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/update_purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/response/purchase_order_dto.dart';

class PurchaseOrderApi {
  final ApiService _api;

  PurchaseOrderApi({required ApiService api}) : _api = api;

  Future<PaginatedList<PurchaseOrderDto>> getPurchaseOrders(PageQuery query) async {
    final data = await _api.getPaginated<PurchaseOrderDto>(
      ApiEndpoints.purchaseOrders,
      queryParams: query.toJson(),
      parser: (json) => parse(json, PurchaseOrderDto.fromJson),
    );

    return PaginatedList<PurchaseOrderDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<PurchaseOrderDto> getPurchaseOrderById(int id) async {
    final data = await _api.get<PurchaseOrderDto>(
      '/purchase-orders/$id',
      parser: (json) => parse(json, PurchaseOrderDto.fromJson),
    );

    return data;
  }

  Future<PurchaseOrderDto> createPurchaseOrder(CreatePurchaseOrderDto dto) async {
    final data = await _api.post<PurchaseOrderDto>(
      ApiEndpoints.purchaseOrders,
      data: dto.toJson(),
      parser: (json) => parse(json, PurchaseOrderDto.fromJson),
    );

    return data;
  }

  Future<PurchaseOrderDto> updatePurchaseOrder({
    required int id,
    required UpdatePurchaseOrderDto dto,
  }) async {
    final data = await _api.update<PurchaseOrderDto>(
      ApiEndpoints.purchaseOrderById(id),
      data: dto.toJson(),
      parser: (json) => parse(json, PurchaseOrderDto.fromJson),
    );

    return data;
  }

  Future<void> delete(int id) async {
    return await _api.delete<PurchaseOrderDto>(ApiEndpoints.purchaseOrderById(id));
  }
}
