import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_result.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/api/stock_take_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

/// Concrete implementation of [StockTakeRepository] that uses [StockTakeApi] for API calls
/// and [BaseRepository] to centralize error handling.
class StockTakeRepositoryImpl extends BaseRepository implements StockTakeRepository {
  final StockTakeApi _api;

  StockTakeRepositoryImpl(this._api);

  @override
  Future<ApiResult<StockTake>> create(NewStockTake payload) {
    return call(() async {
      final response = await _api.create(payload);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<StockTake>> getStockTakeById(int id) {
    return call(() async {
      final response = await _api.getStockTakeById(id);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<StockTakePaginatedList>> getStockTakes({
    required int page,
    required int size,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
  }) {
    return call(() async {
      final response = await _api.getStockTakes(
        page: page,
        size: size,
        status: status,
        startDate: startDate,
        endDate: endDate,
      );
      return response;
    });
  }

  @override
  Future<ApiResult<StockTake>> update(
    StockOrderUpdate type, {
    required int id,
    required StockTake stockTake,
    int? uncountedItemsValue,
  }) async {
    return call(() async {
      final response = await _api.update(
        type,
        id: id,
        stockTake: stockTake,
        uncountedItemsValue: uncountedItemsValue,
      );
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<StockTakeItemsPaginatedList>> getItemsById(
    int id, {
    required int page,
    required int size,
    required bool isCounted,
    String? search,
  }) {
    return call(() async {
      final response = await _api.getItemsById(
        id,
        page: page,
        size: size,
        isCounted: isCounted,
        search: search,
      );
      return response;
    });
  }

  @override
  Future<ApiResult<void>> updateStockItemsById({
    required int id,
    required Map<int, int?> items,
  }) {
    return call(() async {
      final response = await _api.updateStockTakeItemsById(id: id, items: items);
      return response;
    });
  }
}
