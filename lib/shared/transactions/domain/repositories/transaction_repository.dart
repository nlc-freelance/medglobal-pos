import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, TransactionPaginatedList>> getTransactions({
    TransactionType? type,
    required int page,
    required int size,
    String? search,
    int? branch,
    bool? isAllBranches,
    String? startDate,
    String? endDate,
  });
  Future<Either<Failure, Transaction>> getTransactionById(int id);
}
