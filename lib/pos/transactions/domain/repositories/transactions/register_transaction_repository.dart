import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class RegisterTransactionRepository {
  Future<ApiResult<PaginatedList<Transaction>>> getTransactions({
    required int page,
    required int size,
    required int branchId,
    String? search,
  });

  Future<ApiResult<Transaction>> getTransactionById(int id);
}
