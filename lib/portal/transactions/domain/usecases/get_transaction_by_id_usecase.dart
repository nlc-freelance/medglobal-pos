import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/repositories/transaction_repository.dart';

class GetTransactionByIdUseCase implements UseCase<Transaction, GetTransactionByIdParams> {
  final TransactionRepository repository;

  const GetTransactionByIdUseCase(this.repository);

  @override
  Future<Either<Failure, Transaction>> call(GetTransactionByIdParams params) =>
      repository.getTransactionById(params.id);
}

class GetTransactionByIdParams {
  final int id;

  GetTransactionByIdParams(this.id);
}
