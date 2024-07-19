import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

class GetStockTakesUseCase implements UseCase<StockTakePaginatedList, GetStockTakesParams> {
  final StockTakeRepository _repository;

  GetStockTakesUseCase(this._repository);

  @override
  Future<Either<Failure, StockTakePaginatedList>> call(GetStockTakesParams params) => _repository.getStockTakes(
        page: params.page,
        status: params.status,
      );
}

class GetStockTakesParams {
  final int? page;
  final StockOrderStatus? status;

  GetStockTakesParams({this.page, this.status});
}
