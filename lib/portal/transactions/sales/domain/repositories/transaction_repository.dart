import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, TransactionPaginatedList>> getTransactions({int? page, int? register, int? branch});
  Future<Either<Failure, Transaction>> getTransactionById(int id);
}
