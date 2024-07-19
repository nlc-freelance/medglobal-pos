import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/data/dto/stock_return_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/new_stock_return.dart';

abstract class StockReturnApi {
  Future<StockReturnPaginatedList> getStockReturns({int? page, StockOrderStatus? status});
  Future<StockReturnDto> getStockReturnById(int id);
  Future<StockReturnDto> create(NewStockReturn payload);
  Future<void> update(StockOrderUpdate type, {required int id, required StockReturn stockReturn});
}

class StockReturnApiImpl implements StockReturnApi {
  final ApiService _apiService;

  StockReturnApiImpl(this._apiService);

  @override
  Future<StockReturnPaginatedList> getStockReturns({int? page, StockOrderStatus? status}) async {
    try {
      final response = await _apiService.collection<StockReturnDto>(
        '/stock-returns',
        queryParams: {'page': page, 'status': status?.label.toLowerCase()},
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
  Future<void> update(StockOrderUpdate type, {required int id, required StockReturn stockReturn}) async {
    try {
      JSON payload = {};
      if (type == StockOrderUpdate.SAVE) payload = stockReturn.toSavePayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED) payload = stockReturn.toSaveAndMarkAsShippedPayload();
      if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
        payload = stockReturn.toSaveAndMarkAsShippedWithNewItemsPayload();
      }

      await _apiService.update<StockReturnDto>(
        '/stock-returns/$id',
        data: payload,
        converter: StockReturnDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }
}
