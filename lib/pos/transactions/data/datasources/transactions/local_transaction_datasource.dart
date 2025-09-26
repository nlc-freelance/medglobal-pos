import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/transactions/transaction_dao.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';

class LocalTransactionDataSource {
  final TransactionDao _dao;

  LocalTransactionDataSource({required TransactionDao dao}) : _dao = dao;

  Future<PaginatedList<TransactionModel>> getTransactionFrom7Days(
    int page,
    int size,
    int branchId,
    String? search,
  ) async {
    return await _dao.getTransactionsFrom7Days(
      page: page,
      size: size,
      branchId: branchId,
      search: search,
    );
  }

  Future<TransactionDetails> getTransaction(int id) async {
    return await _dao.getTransactionDetailsById(id);
  }
}
