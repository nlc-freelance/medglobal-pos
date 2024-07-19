import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/new_stock_return.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/repositories/stock_return_repository.dart';

class CreateStockReturnUseCase implements UseCase<StockReturn, CreateStockReturnParams> {
  final StockReturnRepository repository;

  const CreateStockReturnUseCase(this.repository);

  @override
  Future<Either<Failure, StockReturn>> call(CreateStockReturnParams params) => repository.create(params.stockReturn);
}

class CreateStockReturnParams {
  final NewStockReturn stockReturn;

  CreateStockReturnParams(this.stockReturn);
}
