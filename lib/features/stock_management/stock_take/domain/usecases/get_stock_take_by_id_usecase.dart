import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

class GetStockTakeByIdUseCase implements UseCase<StockTake, GetStockTakeByIdParams> {
  final StockTakeRepository repository;

  const GetStockTakeByIdUseCase(this.repository);

  @override
  Future<Either<Failure, StockTake>> call(GetStockTakeByIdParams params) => repository.getStockTakeById(params.id);
}

class GetStockTakeByIdParams {
  final int id;

  GetStockTakeByIdParams(this.id);
}
