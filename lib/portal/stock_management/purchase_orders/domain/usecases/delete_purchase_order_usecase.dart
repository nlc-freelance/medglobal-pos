import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class DeletePurchaseOrderUseCase implements UseCase<void, DeletePurchaseOrderParams> {
  final PurchaseOrderRepository repository;

  const DeletePurchaseOrderUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeletePurchaseOrderParams params) => repository.delete(params.id);
}

class DeletePurchaseOrderParams {
  final int id;

  DeletePurchaseOrderParams(this.id);
}
