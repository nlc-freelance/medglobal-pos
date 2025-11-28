import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/dto/stock_take_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/dto/stock_take_item_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';

class StockTakeApi {
  final ApiService _api;

  StockTakeApi({required ApiService api}) : _api = api;

  Future<StockTakePaginatedList> getStockTakes({
    required int page,
    required int size,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
  }) async {
    final data = await _api.getPaginated<StockTakeDto>(
      '/stock-takes',
      queryParams: {
        'page': page,
        'size': size,
        if (status != null) 'status': status.label.toLowerCase(),
        if (startDate != null) 'startDate': startDate,
        if (endDate != null) 'endDate': endDate,
      },
      parser: (json) => parse(json, StockTakeDto.fromJson),
    );

    return StockTakePaginatedList(
      stockTakes: data.items.map((item) => item.toEntity()).toList(),
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<StockTakeDto> getStockTakeById(int id) async {
    final data = await _api.get<StockTakeDto>(
      '/stock-takes/$id',
      parser: (json) => parse(json, StockTakeDto.fromJson),
    );

    return data;
  }

  Future<StockTakeDto> create(NewStockTake payload) async {
    final data = await _api.post<StockTakeDto>(
      '/stock-takes',
      data: payload.toJson(),
      parser: (json) => parse(json, StockTakeDto.fromJson),
    );

    return data;
  }

  Future<StockTakeDto> update(
    StockOrderUpdate type, {
    required int id,
    required StockTake stockTake,
    int? uncountedItemsValue,
  }) async {
    final data = await _api.update<StockTakeDto>(
      '/stock-takes/$id',
      data: stockTake.toPayload(type, uncountedItemsValue: uncountedItemsValue),
      parser: (json) => parse(json, StockTakeDto.fromJson),
    );

    return data;
  }

  Future<StockTakeItemsPaginatedList> getItemsById(
    int id, {
    required int page,
    required int size,
    required bool isCounted,
    String? search,
  }) async {
    final data = await _api.getPaginated<StockTakeItemDto>(
      '/stock-takes/$id/items',
      queryParams: {'page': page, 'isCounted': isCounted, 'size': size, 'search': search},
      parser: (json) => parse(json, StockTakeItemDto.fromJson),
    );

    return StockTakeItemsPaginatedList(
      stockTakeItems: data.items.map((item) => item.toEntity()).toList(),
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<void> updateStockTakeItemsById({required int id, required Map<int, int?> items}) async {
    await _api.update<void>(
      '/stock-takes/$id/items',
      data: {
        'items': [
          ...items.entries.map((entry) => {'id': entry.key, 'countedQuantity': entry.value}),
        ],
      },
      parser: (json) => parse(json, StockTakeItemDto.fromJson),
    );
  }
}
