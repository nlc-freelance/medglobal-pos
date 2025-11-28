import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
import 'package:medglobal_admin_portal/pos/register/data/datasources/local_sale_datasource.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/local_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class LocalSaleRepositoryImpl extends BaseRepository implements LocalSaleRepository {
  final LocalSaleDataSource _localDataSource;

  LocalSaleRepositoryImpl({
    required LocalSaleDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<ApiResult<Transaction>> createSale(Order order, AppSession session) async {
    return call(() async {
      final transaction = await _localDataSource.insertOrder(order, session);
      return transaction.toEntity();
    });
  }
}
