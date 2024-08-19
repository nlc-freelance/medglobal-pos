import 'package:dartz/dartz.dart' hide Order;
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/sale_repository.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';

class CreateSaleUseCase implements UseCase<Transaction, CreateSaleParams> {
  final SaleRepository repository;

  const CreateSaleUseCase(this.repository);

  @override
  Future<Either<Failure, Transaction>> call(CreateSaleParams params) =>
      repository.createSale(registerId: params.registerId, order: params.order);
}

class CreateSaleParams {
  final int registerId;
  final Order order;

  CreateSaleParams(this.registerId, this.order);
}
