import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/repositories/transaction_repository.dart';

class GetTransactionsUseCase implements UseCase<TransactionPaginatedList, GetTransactionsParams> {
  final TransactionRepository _repository;

  GetTransactionsUseCase(this._repository);

  @override
  Future<Either<Failure, TransactionPaginatedList>> call(GetTransactionsParams params) => _repository.getTransactions(
        type: params.type,
        page: params.page,
        size: params.size,
        branch: params.branchId,
      );
}

class GetTransactionsParams {
  final TransactionType type;
  final int page;
  final int size;
  final int? registerId;
  final int? branchId;

  GetTransactionsParams({required this.type, required this.page, required this.size, this.registerId, this.branchId});
}
