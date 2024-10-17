import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

class GetStockTakeItemsByIdUseCase implements UseCase<StockTakeItemsPaginatedList, GetStockTakeItemsByIdParams> {
  final StockTakeRepository _repository;

  GetStockTakeItemsByIdUseCase(this._repository);

  @override
  Future<Either<Failure, StockTakeItemsPaginatedList>> call(GetStockTakeItemsByIdParams params) =>
      _repository.getItemsById(
        params.id,
        page: params.page,
        size: params.size,
        isCounted: params.isCounted,
        search: params.search,
      );
}

class GetStockTakeItemsByIdParams {
  final int id;
  final int page;
  final int size;
  final bool isCounted;
  final String? search;

  GetStockTakeItemsByIdParams({
    required this.id,
    required this.page,
    required this.size,
    required this.isCounted,
    this.search,
  });
}
