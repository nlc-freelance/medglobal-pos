import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

abstract class SaleRepository {
  Future<Either<Failure, Transaction>> createSale({required int registerId, required Transaction order});
}
