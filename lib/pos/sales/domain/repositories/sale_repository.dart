import 'package:dartz/dartz.dart' hide Order;
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class SaleRepository {
  Future<Either<Failure, Transaction>> createSale(Order order);
}
