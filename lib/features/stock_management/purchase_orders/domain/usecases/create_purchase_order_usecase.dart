import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_request.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class CreatePurchaseOrderUsecase implements UseCase<PurchaseOrder, CreatePurchaseOrderParams> {
  final PurchaseOrderRepository repository;

  const CreatePurchaseOrderUsecase(this.repository);

  @override
  Future<Either<Failure, PurchaseOrder>> call(CreatePurchaseOrderParams params) =>
      repository.create(params.purchaseOrderRequest);
}

class CreatePurchaseOrderParams {
  final PurchaseOrderRequest purchaseOrderRequest;

  CreatePurchaseOrderParams(this.purchaseOrderRequest);
}
