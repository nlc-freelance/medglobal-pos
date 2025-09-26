import 'package:dartz/dartz.dart' hide Order;
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class RemoteSaleRepository {
  Future<Either<Failure, Transaction>> createSale(Map<String, dynamic> payload);
  // Future<Either<Failure, Transaction>> createSale(OrderPayload payload);
}
