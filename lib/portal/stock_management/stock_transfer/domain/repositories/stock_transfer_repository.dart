import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';

abstract class StockTransferRepository {
  Future<Either<Failure, StockTransferPaginatedList>> getStockTransfers({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? sourceBranchId,
    int? destinationBranchId,
  });
  Future<Either<Failure, StockTransfer>> getStockTransferById(int id);
  Future<Either<Failure, StockTransfer>> create(NewStockTransfer payload);
  Future<Either<Failure, StockTransfer>> update(StockOrderUpdate type,
      {required int id, required StockTransfer stockTransfer});
  Future<Either<Failure, void>> delete(int id);
}
