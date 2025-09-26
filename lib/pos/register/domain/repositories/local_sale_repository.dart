import 'package:dartz/dartz.dart' hide Order;
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class LocalSaleRepository {
  Future<Either<Failure, Transaction>> createSale(Order order, AppSession session);
}
