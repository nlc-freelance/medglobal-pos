import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/dto/stock_take_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/dto/stock_take_item_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';

// abstract class StockTakeApi {
//   Future<StockTakePaginatedList> getStockTakes({
//     required int page,
//     required int size,
//     StockOrderStatus? status,
//     String? startDate,
//     String? endDate,
//   });
//   Future<StockTakeDto> getStockTakeById(int id);
//   Future<StockTakeItemsPaginatedList> getItemsById(
//     int id, {
//     required int page,
//     required int size,
//     required bool isCounted,
//     String? search,
//   });
//   Future<StockTakeDto> create(NewStockTake payload);
//   Future<void> updateStockTakeItemsById({required int id, required Map<int, int?> items});
//   Future<StockTakeDto> update(
//     StockOrderUpdate type, {
//     required int id,
//     required StockTake stockTake,
//     int? uncountedItemsValue,
//   });
// }

class StockTakeApi {
  final ApiService _apiService;

  StockTakeApi(this._apiService);

  Future<StockTakePaginatedList> getStockTakes({
    required int page,
    required int size,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _apiService.collection<StockTakeDto>(
        '/stock-takes',
        queryParams: {
          'page': page,
          'size': size,
          if (status != null) 'status': status.label.toLowerCase(),
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
        converter: StockTakeDto.fromJson,
      );

      return StockTakePaginatedList(
        stockTakes: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<StockTakeDto> getStockTakeById(int id) async {
    try {
      return await _apiService.get<StockTakeDto>(
        '/stock-takes/$id',
        converter: StockTakeDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<StockTakeDto> create(NewStockTake payload) async {
    try {
      return await _apiService.post<StockTakeDto>(
        '/stock-takes',
        data: payload.toJson(),
        converter: StockTakeDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<StockTakeDto> update(
    StockOrderUpdate type, {
    required int id,
    required StockTake stockTake,
    int? uncountedItemsValue,
  }) async {
    try {
      final response = await _apiService.update<StockTakeDto>(
        '/stock-takes/$id',
        data: stockTake.toPayload(type, uncountedItemsValue: uncountedItemsValue),
        converter: StockTakeDto.fromJson,
      );

      return response!;
    } catch (_) {
      rethrow;
    }
  }

  Future<StockTakeItemsPaginatedList> getItemsById(
    int id, {
    required int page,
    required int size,
    required bool isCounted,
    String? search,
  }) async {
    try {
      final response = await _apiService.collection<StockTakeItemDto>(
        '/stock-takes/$id/items',
        queryParams: {'page': page, 'isCounted': isCounted, 'size': size, 'search': search},
        converter: StockTakeItemDto.fromJson,
      );

      return StockTakeItemsPaginatedList(
        stockTakeItems: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateStockTakeItemsById({required int id, required Map<int, int?> items}) async {
    try {
      await _apiService.update<StockTakeItemDto>(
        '/stock-takes/$id/items',
        data: {
          'items': [
            ...items.entries.map((entry) => {'id': entry.key, 'countedQuantity': entry.value}),
          ],
        },
        converter: StockTakeItemDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }
}
