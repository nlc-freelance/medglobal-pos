import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class TransactionRepository {
  // /// Retrieves a list of transactions from the branch the current user is assigned to.
  // Future<ApiResult<PaginatedList<Transaction>>> getBranchTransactions({
  //   required int page,
  //   required int size,
  //   String? search,
  // });

  /// Retrieves a list of all transactions based on given parameters
  Future<ApiResult<PaginatedList<Transaction>>> getTransactions({
    TransactionType? type,
    required int page,
    required int size,
    String? search,
    int? shift,
    int? branch,
    bool? isAllBranches,
    String? startDate,
    String? endDate,
  });

  /// Retrieves a single transaction by given ID
  Future<ApiResult<Transaction>> getTransactionById(int id);
}
