import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';

abstract class StockTakeRepository {
  Future<Either<Failure, StockTakePaginatedList>> getStockTakes(
      {required int page, required int size, StockOrderStatus? status});
  Future<Either<Failure, StockTake>> getStockTakeById(int id);
  Future<Either<Failure, StockTake>> create(NewStockTake payload);
  Future<Either<Failure, StockTake>> update(StockOrderUpdate type, {required int id, required StockTake stockTake});
}
