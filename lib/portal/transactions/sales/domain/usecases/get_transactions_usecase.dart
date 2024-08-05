import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/repositories/transaction_repository.dart';

class GetTransactionsUseCase implements UseCase<TransactionPaginatedList, GetTransactionsParams> {
  final TransactionRepository _repository;

  GetTransactionsUseCase(this._repository);

  @override
  Future<Either<Failure, TransactionPaginatedList>> call(GetTransactionsParams params) => _repository.getTransactions(
        page: params.page,
        register: params.registerId,
        branch: params.branchId,
      );
}

class GetTransactionsParams {
  final int? page;
  final int? registerId;
  final int? branchId;

  GetTransactionsParams({this.page, this.registerId, this.branchId});
}
