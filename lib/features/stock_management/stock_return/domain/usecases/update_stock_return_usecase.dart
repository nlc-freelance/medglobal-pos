import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/repositories/stock_return_repository.dart';

class UpdateStockReturnUseCase implements UseCase<void, UpdateStockReturnParams> {
  final StockReturnRepository repository;

  const UpdateStockReturnUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateStockReturnParams params) =>
      repository.update(params.type, id: params.id, stockReturn: params.stockReturn);
}

class UpdateStockReturnParams {
  final StockOrderUpdate type;
  final int id;
  final StockReturn stockReturn;

  UpdateStockReturnParams(this.type, {required this.id, required this.stockReturn});
}
