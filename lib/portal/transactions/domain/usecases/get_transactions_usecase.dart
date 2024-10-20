import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/repositories/transaction_repository.dart';

class GetTransactionsUseCase implements UseCase<TransactionPaginatedList, GetTransactionsParams> {
  final TransactionRepository _repository;

  GetTransactionsUseCase(this._repository);

  @override
  Future<Either<Failure, TransactionPaginatedList>> call(GetTransactionsParams params) => _repository.getTransactions(
        type: params.type,
        page: params.page,
        size: params.size,
        branch: params.branchId,
        isAllBranches: params.isAllBranches,
        startDate: params.startDate,
        endDate: params.endDate,
      );
}

class GetTransactionsParams {
  final TransactionType? type;
  final int page;
  final int size;
  final int? branchId;
  final bool? isAllBranches;
  final String? startDate;
  final String? endDate;

  GetTransactionsParams({
    this.type,
    required this.page,
    required this.size,
    this.branchId,
    this.isAllBranches,
    this.startDate,
    this.endDate,
  });
}
