import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';

abstract class StockTakeRepository {
  Future<ApiResult<StockTakePaginatedList>> getStockTakes({
    required int page,
    required int size,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
  });

  Future<ApiResult<StockTake>> getStockTakeById(int id);

  Future<ApiResult<StockTakeItemsPaginatedList>> getItemsById(
    int id, {
    required int page,
    required int size,
    required bool isCounted,
    String? search,
  });

  Future<ApiResult<StockTake>> create(NewStockTake payload);

  Future<ApiResult<void>> updateStockItemsById({
    required int id,
    required Map<int, int?> items,
  });

  Future<ApiResult<StockTake>> update(
    StockOrderUpdate type, {
    required int id,
    required StockTake stockTake,
    int? uncountedItemsValue,
  });
}
