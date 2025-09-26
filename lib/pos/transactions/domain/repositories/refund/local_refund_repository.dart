import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class LocalRefundRepository {
  Future<Either<Failure, Transaction>> createRefund(Transaction transaction, List<RefundItem> items);
}
