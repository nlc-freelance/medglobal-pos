import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

class CreateStockTakeUseCase implements UseCase<StockTake, CreateStockTakeParams> {
  final StockTakeRepository repository;

  const CreateStockTakeUseCase(this.repository);

  @override
  Future<ApiResult<StockTake>> call(CreateStockTakeParams params) => repository.create(params.stockTake);
}

class CreateStockTakeParams {
  final NewStockTake stockTake;

  CreateStockTakeParams(this.stockTake);
}
