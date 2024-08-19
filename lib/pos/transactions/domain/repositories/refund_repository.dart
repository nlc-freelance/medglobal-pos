import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

abstract class RefundRepository {
  Future<Either<Failure, Transaction>> create(Transaction transaction);
}
