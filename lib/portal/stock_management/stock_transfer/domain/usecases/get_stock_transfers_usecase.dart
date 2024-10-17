import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';

class GetStockTransfersUseCase implements UseCase<StockTransferPaginatedList, GetStockTransfersParams> {
  final StockTransferRepository _repository;

  GetStockTransfersUseCase(this._repository);

  @override
  Future<Either<Failure, StockTransferPaginatedList>> call(GetStockTransfersParams params) =>
      _repository.getStockTransfers(
        page: params.page,
        size: params.size,
        status: params.status,
        sourceBranchId: params.sourceBranchId,
        destinationBranchId: params.destinationBranchId,
      );
}

class GetStockTransfersParams {
  final int page;
  final int size;
  final int? sourceBranchId;
  final int? destinationBranchId;
  final StockOrderStatus? status;

  GetStockTransfersParams({
    required this.page,
    required this.size,
    this.status,
    this.sourceBranchId,
    this.destinationBranchId,
  });
}
