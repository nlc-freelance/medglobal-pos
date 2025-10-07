import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class LocalRefundRepository {
  Future<ApiResult<Transaction>> createRefund(Transaction transaction, List<RefundItem> items);
}
