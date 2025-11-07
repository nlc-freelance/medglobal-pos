import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';

class DeleteStockTransferUseCase implements UseCase<void, DeleteStockTransferParams> {
  final StockTransferRepository repository;

  const DeleteStockTransferUseCase(this.repository);

  @override
  Future<ApiResult<void>> call(DeleteStockTransferParams params) => repository.delete(params.id);
}

class DeleteStockTransferParams {
  final int id;

  DeleteStockTransferParams(this.id);
}
