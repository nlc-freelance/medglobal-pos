import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/domain/repositories/return_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class UpdateReturnTransactionUseCase implements UseCase<Transaction, UpdateReturnTransactionParams> {
  final ReturnRepository repository;

  const UpdateReturnTransactionUseCase(this.repository);

  @override
  Future<Either<Failure, Transaction>> call(UpdateReturnTransactionParams params) =>
      repository.update(params.transaction);
}

class UpdateReturnTransactionParams {
  final Transaction transaction;

  UpdateReturnTransactionParams(this.transaction);
}
