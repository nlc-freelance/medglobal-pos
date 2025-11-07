import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/old_api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/data/dto/stock_return_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/new_stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';

class StockReturnApi {
  final ApiService _api;

  StockReturnApi({required ApiService api}) : _api = api;

  Future<StockReturnPaginatedList> getStockReturns({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    final data = await _api.getPaginated<StockReturnDto>(
      '/stock-returns',
      queryParams: {
        'page': page,
        'size': size,
        if (status != null) 'status': status.label.toLowerCase(),
        if (branchId != null) 'branch': branchId,
        if (startDate != null) 'startDate': startDate,
        if (endDate != null) 'endDate': endDate,
      },
      parser: (json) => parse(json, StockReturnDto.fromJson),
    );

    return StockReturnPaginatedList(
      stockReturns: data.items.map((item) => item.toEntity()).toList(),
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<StockReturnDto> getStockReturnById(int id) async {
    final data = await _api.get<StockReturnDto>(
      '/stock-returns/$id',
      parser: (json) => parse(json, StockReturnDto.fromJson),
    );

    return data;
  }

  Future<StockReturnDto> create(NewStockReturn payload) async {
    final data = await _api.post<StockReturnDto>(
      '/stock-returns',
      data: payload.toJson(),
      parser: (json) => parse(json, StockReturnDto.fromJson),
    );

    return data;
  }

  Future<StockReturnDto> update(StockOrderUpdate type, {required int id, required StockReturn stockReturn}) async {
    JSON payload = {};
    if (type == StockOrderUpdate.SAVE) payload = stockReturn.toSavePayload();
    if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED) payload = stockReturn.toSaveAndMarkAsShippedPayload();
    if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
      payload = stockReturn.toSaveAndMarkAsShippedWithNewItemsPayload();
    }

    final data = await _api.update<StockReturnDto>(
      '/stock-returns/$id',
      data: payload,
      parser: (json) => parse(json, StockReturnDto.fromJson),
    );

    return data;
  }
}
