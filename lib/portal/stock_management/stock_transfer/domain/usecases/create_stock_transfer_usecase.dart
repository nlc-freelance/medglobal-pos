import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';

class CreateStockTransferUseCase implements UseCase<StockTransfer, CreateStockTransferParams> {
  final StockTransferRepository repository;

  const CreateStockTransferUseCase(this.repository);

  @override
  Future<ApiResult<StockTransfer>> call(CreateStockTransferParams params) => repository.create(params.stockTransfer);
}

class CreateStockTransferParams {
  final NewStockTransfer stockTransfer;

  CreateStockTransferParams(this.stockTransfer);
}
