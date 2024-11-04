import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/data/dto/stock_transfer_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';

abstract class StockTransferApi {
  Future<StockTransferPaginatedList> getStockTransfers({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? sourceBranchId,
    int? destinationBranchId,
    String? startDate,
    String? endDate,
  });
  Future<StockTransferDto> getStockTransferById(int id);
  Future<StockTransferDto> create(NewStockTransfer payload);
  Future<StockTransferDto> update(StockOrderUpdate type, {required int id, required StockTransfer stockTransfer});
  Future<void> delete(int id);
}

class StockTransferApiImpl implements StockTransferApi {
  final ApiService _apiService;

  StockTransferApiImpl(this._apiService);

  @override
  Future<StockTransferPaginatedList> getStockTransfers({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? sourceBranchId,
    int? destinationBranchId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _apiService.collection<StockTransferDto>(
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
        converter: StockTransferDto.fromJson,
      );

      return StockTransferPaginatedList(
        stockTransfers: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StockTransferDto> getStockTransferById(int id) async {
    try {
      return await _apiService.get<StockTransferDto>(
        '/stock-transfers/$id',
        converter: StockTransferDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<StockTransferDto> create(NewStockTransfer payload) async {
    try {
      return await _apiService.post<StockTransferDto>(
        '/stock-transfers',
        data: payload.toJson(),
        converter: StockTransferDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StockTransferDto> update(StockOrderUpdate type,
      {required int id, required StockTransfer stockTransfer}) async {
    try {
      JSON payload = {};
      if (type == StockOrderUpdate.SAVE) payload = stockTransfer.toSavePayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED) payload = stockTransfer.toSaveAndMarkAsShippedPayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
        payload = stockTransfer.toSaveAndMarkAsShippedWithNewItemsPayload();
      }
      if (type == StockOrderUpdate.SAVE_AND_RECEIVED) payload = stockTransfer.toSaveAndReceivedPayload();
      if (type == StockOrderUpdate.CANCEL) payload = stockTransfer.toCancelPayload();

      final response = await _apiService.update<StockTransferDto>(
        '/stock-transfers/$id',
        data: payload,
        converter: StockTransferDto.fromJson,
      );

      return response!;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _apiService.delete<StockTransferDto>('/stock-transfers/$id');
    } catch (_) {
      rethrow;
    }
  }
}
