import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';

abstract class StockTransferRepository {
  Future<ApiResult<StockTransferPaginatedList>> getStockTransfers({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? sourceBranchId,
    int? destinationBranchId,
    String? startDate,
    String? endDate,
  });

  Future<ApiResult<StockTransfer>> getStockTransferById(int id);

  Future<ApiResult<StockTransfer>> create(NewStockTransfer payload);

  Future<ApiResult<StockTransfer>> update(StockOrderUpdate type,
      {required int id, required StockTransfer stockTransfer});

  Future<ApiResult<void>> delete(int id);
}
