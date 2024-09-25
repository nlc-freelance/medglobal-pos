import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/new_stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';

abstract class StockReturnRepository {
  Future<Either<Failure, StockReturnPaginatedList>> getStockReturns({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? branchId,
  });
  Future<Either<Failure, StockReturn>> getStockReturnById(int id);
  Future<Either<Failure, StockReturn>> create(NewStockReturn payload);
  Future<Either<Failure, StockReturn>> update(StockOrderUpdate type,
      {required int id, required StockReturn stockReturn});
}
