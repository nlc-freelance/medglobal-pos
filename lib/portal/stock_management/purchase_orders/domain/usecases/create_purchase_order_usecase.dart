import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class CreatePurchaseOrderUseCase implements UseCase<PurchaseOrder, CreatePurchaseOrderParams> {
  final PurchaseOrderRepository repository;

  const CreatePurchaseOrderUseCase(this.repository);

  @override
  Future<Either<Failure, PurchaseOrder>> call(CreatePurchaseOrderParams params) =>
      repository.create(params.purchaseOrder);
}

class CreatePurchaseOrderParams {
  final NewPurchaseOrder purchaseOrder;

  CreatePurchaseOrderParams(this.purchaseOrder);
}
