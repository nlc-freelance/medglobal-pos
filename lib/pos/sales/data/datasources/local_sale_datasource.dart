import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';

class LocalSaleDataSource {
  final TransactionDao _dao;

  LocalSaleDataSource({required TransactionDao dao}) : _dao = dao;

  Future<TransactionDetails> insertOrder(Order order, AppSession session) async {
    final id = await _dao.insertOrderWithItems(
      order.toTransactionCompanion(session),
      order.items.map((item) => item.toTransactionItemCompanion()).toList(),
    );
    return await _dao.getTransactionDetailsById(id);
  }

  // Future<List<Order>> getUnsyncedOrders() async {
  //   final orders = await dao.getUnsyncedOrders();
  //   return orders.map((o) => o.toEntity()).toList();
  // }

  Future<void> markAsSynced(int id) => _dao.markAsSynced(id);

  // Stream<List<Order>> watchOrders() => dao.watchAllOrders().map(
  //       (list) => list.map((m) => m.toEntity()).toList(),
  //     );
}
