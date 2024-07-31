import 'package:dartz/dartz.dart' hide Order;
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class SaleRepository {
  Future<Either<Failure, Transaction>> createSale({required int registerId, required Order order});
}
