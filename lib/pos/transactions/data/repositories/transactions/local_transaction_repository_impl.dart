import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/transactions/local_transaction_datasource.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transactions/register_transaction_repository.dart';

class LocalTransactionRepositoryImpl extends BaseRepository implements RegisterTransactionRepository {
  final LocalTransactionDataSource _localDataSource;

  LocalTransactionRepositoryImpl({
    required LocalTransactionDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  /// Retrieves a list of transactions from local DB
  @override
  Future<Either<Failure, PaginatedList<Transaction>>> getTransactions({
    required int page,
    required int size,
    required int branchId,
    String? search,
  }) {
    return call(() async {
      final data = await _localDataSource.getTransactionFrom7Days(page, size, branchId, search);

      return PaginatedList<Transaction>(
        items: data.items.map((item) => item.toEntity()).toList(),
        currentSize: data.currentSize,
        currentPage: data.currentPage,
        totalPages: data.totalPages,
        totalCount: data.totalCount,
      );
    });
  }

  /// Retrieves a single transaction by given ID from local DB
  @override
  Future<Either<Failure, Transaction>> getTransactionById(int id) {
    return call(() async {
      final data = await _localDataSource.getTransaction(id);
      return data.toEntity();
    });
  }
}
