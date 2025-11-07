import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';

class GetStockTransferByIdUseCase implements UseCase<StockTransfer, GetStockTransferByIdParams> {
  final StockTransferRepository repository;

  const GetStockTransferByIdUseCase(this.repository);

  @override
  Future<ApiResult<StockTransfer>> call(GetStockTransferByIdParams params) =>
      repository.getStockTransferById(params.id);
}

class GetStockTransferByIdParams {
  final int id;

  GetStockTransferByIdParams(this.id);
}
