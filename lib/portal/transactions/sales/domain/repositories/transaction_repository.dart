import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction_paginated_list.dart';

abstract class TransactionRepository {
  Future<Either<Failure, TransactionPaginatedList>> getTransactions({
    required TransactionType type,
    required int page,
    required int size,
    int? register,
    int? branch,
  });
  Future<Either<Failure, Transaction>> getTransactionById(int id);
}
