import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class RegisterTransactionRepository {
  Future<Either<Failure, PaginatedList<Transaction>>> getTransactions({
    required int page,
    required int size,
    required int branchId,
    String? search,
  });

  Future<Either<Failure, Transaction>> getTransactionById(int id);
}
