import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/data/api/stock_return_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/new_stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/repositories/stock_return_repository.dart';

/// Concrete implementation of [StockReturnRepository] that uses [StockReturnApi] for API calls
/// and [BaseRepository] to centralize error handling.
class StockReturnRepositoryImpl extends BaseRepository implements StockReturnRepository {
  final StockReturnApi _api;

  StockReturnRepositoryImpl(this._api);

  @override
  Future<ApiResult<StockReturn>> create(NewStockReturn payload) {
    return call(() async {
      final response = await _api.create(payload);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<StockReturn>> getStockReturnById(int id) {
    return call(() async {
      final response = await _api.getStockReturnById(id);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<StockReturnPaginatedList>> getStockReturns({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  }) {
    return call(() async {
      final response = await _api.getStockReturns(
        page: page,
        size: size,
        status: status,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
      );
      return response;
    });
  }

  @override
  Future<ApiResult<StockReturn>> update(
    StockOrderUpdate type, {
    required int id,
    required StockReturn stockReturn,
  }) {
    return call(() async {
      final response = await _api.update(type, id: id, stockReturn: stockReturn);
      return response.toEntity();
    });
  }
}
