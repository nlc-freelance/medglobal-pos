import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/refund/local_refund_datasource.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund/local_refund_repository.dart';

class LocalRefundRepositoryImpl extends BaseRepository implements LocalRefundRepository {
  final LocalRefundDataSource _localDataSource;

  LocalRefundRepositoryImpl({
    required LocalRefundDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, Transaction>> createRefund(
    Transaction transaction,
    List<RefundItem> items,
  ) {
    return call(() async {
      final data = await _localDataSource.insertRefund(transaction, items);
      return data.toEntity();
    });
  }
}
