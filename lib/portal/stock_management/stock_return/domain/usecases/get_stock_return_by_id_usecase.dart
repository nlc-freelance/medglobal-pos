import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/repositories/stock_return_repository.dart';

class GetStockReturnByIdUseCase implements UseCase<StockReturn, GetStockReturnByIdParams> {
  final StockReturnRepository repository;

  const GetStockReturnByIdUseCase(this.repository);

  @override
  Future<ApiResult<StockReturn>> call(GetStockReturnByIdParams params) => repository.getStockReturnById(params.id);
}

class GetStockReturnByIdParams {
  final int id;

  GetStockReturnByIdParams(this.id);
}
