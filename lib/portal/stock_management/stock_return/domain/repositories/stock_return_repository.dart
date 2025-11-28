import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/new_stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';

abstract class StockReturnRepository {
  Future<ApiResult<StockReturnPaginatedList>> getStockReturns({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  });
  Future<ApiResult<StockReturn>> getStockReturnById(int id);
  Future<ApiResult<StockReturn>> create(NewStockReturn payload);
  Future<ApiResult<StockReturn>> update(
    StockOrderUpdate type, {
    required int id,
    required StockReturn stockReturn,
  });
}
