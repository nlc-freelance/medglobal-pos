import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class UpdatePurchaseOrderUsecase implements UseCase<void, UpdatePurchaseOrderParams> {
  final PurchaseOrderRepository repository;

  const UpdatePurchaseOrderUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdatePurchaseOrderParams params) =>
      repository.update(params.type, id: params.id, purchaseOrder: params.purchaseOrder);
}

class UpdatePurchaseOrderParams {
  final PurchaseOrderUpdate type;
  final int id;
  final PurchaseOrder purchaseOrder;

  UpdatePurchaseOrderParams(this.type, {required this.id, required this.purchaseOrder});
}
