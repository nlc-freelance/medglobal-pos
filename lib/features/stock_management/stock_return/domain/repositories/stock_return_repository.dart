import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/new_stock_return.dart';

abstract class StockReturnRepository {
  Future<Either<Failure, StockReturnPaginatedList>> getStockReturns({int? page, StockOrderStatus? status});
  Future<Either<Failure, StockReturn>> getStockReturnById(int id);
  Future<Either<Failure, StockReturn>> create(NewStockReturn payload);
  Future<Either<Failure, void>> update(StockOrderUpdate type, {required int id, required StockReturn stockReturn});
}
