import 'package:medglobal_admin_portal/core/local_db/db_tables/transactions/mappers/refund_mapper.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/transactions/transaction_dao.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class LocalRefundDataSource {
  final TransactionDao _dao;

  LocalRefundDataSource({required TransactionDao dao}) : _dao = dao;

  Future<TransactionDetails> insertRefund(Transaction transaction, List<RefundItem> items) async {
    final id = await _dao.insertTransaction(
      transaction.toRefundTransactionCompanion(),
      items.map((item) => item.toTransactionItemCompanion()).toList(),
    );
    return await _dao.getTransactionDetailsById(id);
  }
}
