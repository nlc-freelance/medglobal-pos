import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class ReturnRepository {
  Future<Either<Failure, Transaction>> update(Transaction transaction);
}
