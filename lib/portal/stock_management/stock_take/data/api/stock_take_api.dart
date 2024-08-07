import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/dto/stock_take_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';

abstract class StockTakeApi {
  Future<StockTakePaginatedList> getStockTakes({int? page, StockOrderStatus? status});
  Future<StockTakeDto> getStockTakeById(int id);
  Future<StockTakeDto> create(NewStockTake payload);
  Future<StockTakeDto> update(StockOrderUpdate type, {required int id, required StockTake stockTake});
}

class StockTakeApiImpl implements StockTakeApi {
  final ApiService _apiService;

  StockTakeApiImpl(this._apiService);

  @override
  Future<StockTakePaginatedList> getStockTakes({int? page, StockOrderStatus? status}) async {
    try {
      final response = await _apiService.collection<StockTakeDto>(
        '/stock-takes',
        queryParams: {'page': page, 'status': status?.label.toLowerCase()},
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

  @override
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

  @override
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

  @override
  Future<StockTakeDto> update(StockOrderUpdate type, {required int id, required StockTake stockTake}) async {
    try {
      final response = await _apiService.update<StockTakeDto>(
        '/stock-takes/$id',
        data: stockTake.toPayload(type),
        converter: StockTakeDto.fromJson,
      );

      return response!;
    } catch (_) {
      rethrow;
    }
  }
}
