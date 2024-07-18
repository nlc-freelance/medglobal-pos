import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

class GetPurchaseOrderByIdUseCase implements UseCase<PurchaseOrder, GetPurchaseOrderByIdParams> {
  final PurchaseOrderRepository repository;

  const GetPurchaseOrderByIdUseCase(this.repository);

  @override
  Future<Either<Failure, PurchaseOrder>> call(GetPurchaseOrderByIdParams params) =>
      repository.getPurchaseOrderById(params.id);
}

class GetPurchaseOrderByIdParams {
  final int id;

  GetPurchaseOrderByIdParams(this.id);
}
