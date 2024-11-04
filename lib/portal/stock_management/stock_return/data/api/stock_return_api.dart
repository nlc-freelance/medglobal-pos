import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/data/dto/stock_return_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/new_stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';

abstract class StockReturnApi {
  Future<StockReturnPaginatedList> getStockReturns({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  });
  Future<StockReturnDto> getStockReturnById(int id);
  Future<StockReturnDto> create(NewStockReturn payload);
  Future<StockReturnDto> update(StockOrderUpdate type, {required int id, required StockReturn stockReturn});
}

class StockReturnApiImpl implements StockReturnApi {
  final ApiService _apiService;

  StockReturnApiImpl(this._apiService);

  @override
  Future<StockReturnPaginatedList> getStockReturns({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _apiService.collection<StockReturnDto>(
        '/stock-returns',
        queryParams: {
          'page': page,
          'size': size,
          if (status != null) 'status': status.label.toLowerCase(),
          if (branchId != null) 'branch': branchId,
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
        converter: StockReturnDto.fromJson,
      );

      return StockReturnPaginatedList(
        stockReturns: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StockReturnDto> getStockReturnById(int id) async {
    try {
      return await _apiService.get<StockReturnDto>(
        '/stock-returns/$id',
        converter: StockReturnDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<StockReturnDto> create(NewStockReturn payload) async {
    try {
      return await _apiService.post<StockReturnDto>(
        '/stock-returns',
        data: payload.toJson(),
        converter: StockReturnDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StockReturnDto> update(StockOrderUpdate type, {required int id, required StockReturn stockReturn}) async {
    try {
      JSON payload = {};
      if (type == StockOrderUpdate.SAVE) payload = stockReturn.toSavePayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED) payload = stockReturn.toSaveAndMarkAsShippedPayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
        payload = stockReturn.toSaveAndMarkAsShippedWithNewItemsPayload();
      }

      final response = await _apiService.update<StockReturnDto>(
        '/stock-returns/$id',
        data: payload,
        converter: StockReturnDto.fromJson,
      );

      return response!;
    } catch (_) {
      rethrow;
    }
  }
}
