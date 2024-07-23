import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';

class UpdateStockTransferUseCase implements UseCase<void, UpdateStockTransferParams> {
  final StockTransferRepository repository;

  const UpdateStockTransferUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateStockTransferParams params) =>
      repository.update(params.type, id: params.id, stockTransfer: params.stockTransfer);
}

class UpdateStockTransferParams {
  final StockOrderUpdate type;
  final int id;
  final StockTransfer stockTransfer;

  UpdateStockTransferParams(this.type, {required this.id, required this.stockTransfer});
}
