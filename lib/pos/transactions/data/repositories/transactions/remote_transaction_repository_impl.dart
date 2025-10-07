import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/transactions/transaction_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transactions/register_transaction_repository.dart';

class RemoteTransactionRepositoryImpl extends BaseRepository implements RegisterTransactionRepository {
  final TransactionApi _api;

  RemoteTransactionRepositoryImpl({required TransactionApi api}) : _api = api;

  /// Retrieves a list of transactions
  @override
  Future<ApiResult<PaginatedList<Transaction>>> getTransactions({
    required int page,
    required int size,
    required int branchId,
    String? search,
  }) {
    return call(() async {
      final response = await _api.getTransactions(
        page: page,
        size: size,
        search: search,
      );

      return response.convert((item) => item.toDomain());
    });
  }

  /// Retrieves a single transaction by given ID
  @override
  Future<ApiResult<Transaction>> getTransactionById(int id) {
    return call(() async {
      final response = await _api.getTransactionById(id);
      return response.toDomain();
    });
  }
}
