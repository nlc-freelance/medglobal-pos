import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

class UpdateStockTakeUseCase implements UseCase<void, UpdateStockTakeParams> {
  final StockTakeRepository repository;

  const UpdateStockTakeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateStockTakeParams params) =>
      repository.update(params.type, id: params.id, stockTake: params.stockTake);
}

class UpdateStockTakeParams {
  final StockOrderUpdate type;
  final int id;
  final StockTake stockTake;

  UpdateStockTakeParams(this.type, {required this.id, required this.stockTake});
}
