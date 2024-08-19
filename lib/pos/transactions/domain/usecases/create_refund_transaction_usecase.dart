import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund_repository.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

class CreateRefundTransactionUseCase implements UseCase<Transaction, CreateRefundTransactionParams> {
  final RefundRepository repository;

  const CreateRefundTransactionUseCase(this.repository);

  @override
  Future<Either<Failure, Transaction>> call(CreateRefundTransactionParams params) =>
      repository.create(params.transaction);
}

class CreateRefundTransactionParams {
  final Transaction transaction;

  CreateRefundTransactionParams(this.transaction);
}
