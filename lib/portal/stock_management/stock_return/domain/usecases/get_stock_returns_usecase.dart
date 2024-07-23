import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/repositories/stock_return_repository.dart';

class GetStockReturnsUseCase implements UseCase<StockReturnPaginatedList, GetStockReturnsParams> {
  final StockReturnRepository _repository;

  GetStockReturnsUseCase(this._repository);

  @override
  Future<Either<Failure, StockReturnPaginatedList>> call(GetStockReturnsParams params) => _repository.getStockReturns(
        page: params.page,
        status: params.status,
      );
}

class GetStockReturnsParams {
  final int? page;
  final StockOrderStatus? status;

  GetStockReturnsParams({this.page, this.status});
}
