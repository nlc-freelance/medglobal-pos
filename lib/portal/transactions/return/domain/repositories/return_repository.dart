import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class ReturnRepository {
  Future<ApiResult<Transaction>> update(Transaction transaction);
}
