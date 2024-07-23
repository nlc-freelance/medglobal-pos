import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';

abstract class StockTransferRepository {
  Future<Either<Failure, StockTransferPaginatedList>> getStockTransfers({int? page, StockOrderStatus? status});
  Future<Either<Failure, StockTransfer>> getStockTransferById(int id);
  Future<Either<Failure, StockTransfer>> create(NewStockTransfer payload);
  Future<Either<Failure, void>> update(StockOrderUpdate type, {required int id, required StockTransfer stockTransfer});
}
