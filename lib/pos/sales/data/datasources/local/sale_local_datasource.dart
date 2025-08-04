import 'package:medglobal_admin_portal/core/local_db/native/transactions/transaction_dao.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class SaleLocalDataSource {
  final TransactionDao _dao;

  SaleLocalDataSource({required TransactionDao dao}) : _dao = dao;

  Future<Transaction> insertOrder(Order order) async {
    final id = await _dao.insertOrderWithItems(
      order.toDriftCompanion(),
      order.items.map((item) => item.toDriftCompanion()).toList(),
    );

    final transaction = await _dao.getTransactionDetailsById(id);

    return transaction.toEntity();
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
