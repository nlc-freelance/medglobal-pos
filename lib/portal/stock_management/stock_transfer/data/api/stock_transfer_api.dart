import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/old_api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/data/dto/stock_transfer_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';

class StockTransferApi {
  final ApiService _api;

  StockTransferApi({required ApiService api}) : _api = api;

  Future<StockTransferPaginatedList> getStockTransfers({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? sourceBranchId,
    int? destinationBranchId,
    String? startDate,
    String? endDate,
  }) async {
    final data = await _api.getPaginated<StockTransferDto>(
      '/stock-transfers',
      queryParams: {
        'page': page,
        'size': size,
        if (status != null) 'status': status.label.toLowerCase(),
        if (sourceBranchId != null) 'fromBranch': sourceBranchId,
        if (destinationBranchId != null) 'toBranch': destinationBranchId,
        if (startDate != null) 'startDate': startDate,
        if (endDate != null) 'endDate': endDate,
      },
      parser: (json) => parse(json, StockTransferDto.fromJson),
    );

    return StockTransferPaginatedList(
      stockTransfers: data.items.map((item) => item.toEntity()).toList(),
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<StockTransferDto> getStockTransferById(int id) async {
    final data = await _api.get<StockTransferDto>(
      '/stock-transfers/$id',
      parser: (json) => parse(json, StockTransferDto.fromJson),
    );

    return data;
  }

  Future<StockTransferDto> create(NewStockTransfer payload) async {
    return await _api.post<StockTransferDto>(
      '/stock-transfers',
      data: payload.toJson(),
      parser: (json) => parse(json, StockTransferDto.fromJson),
    );
  }

  Future<StockTransferDto> update(
    StockOrderUpdate type, {
    required int id,
    required StockTransfer stockTransfer,
  }) async {
    JSON payload = {};
    if (type == StockOrderUpdate.SAVE) payload = stockTransfer.toSavePayload();
    if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED) payload = stockTransfer.toSaveAndMarkAsShippedPayload();
    if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
      payload = stockTransfer.toSaveAndMarkAsShippedWithNewItemsPayload();
    }
    if (type == StockOrderUpdate.SAVE_AND_RECEIVED) payload = stockTransfer.toSaveAndReceivedPayload();
    if (type == StockOrderUpdate.CANCEL) payload = stockTransfer.toCancelPayload();

    final data = await _api.update<StockTransferDto>(
      '/stock-transfers/$id',
      data: payload,
      parser: (json) => parse(json, StockTransferDto.fromJson),
    );

    return data;
  }

  Future<void> delete(int id) async {
    await _api.delete<StockTransferDto>('/stock-transfers/$id');
  }
}
