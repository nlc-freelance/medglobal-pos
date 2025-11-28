import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

class GetStockTakesUseCase implements UseCase<StockTakePaginatedList, GetStockTakesParams> {
  final StockTakeRepository _repository;

  GetStockTakesUseCase(this._repository);

  @override
  Future<ApiResult<StockTakePaginatedList>> call(GetStockTakesParams params) => _repository.getStockTakes(
        page: params.page,
        size: params.size,
        status: params.status,
        startDate: params.startDate,
        endDate: params.endDate,
      );
}

class GetStockTakesParams {
  final int page;
  final int size;
  final StockOrderStatus? status;
  final String? startDate;
  final String? endDate;

  GetStockTakesParams({required this.page, required this.size, this.status, this.startDate, this.endDate});
}
