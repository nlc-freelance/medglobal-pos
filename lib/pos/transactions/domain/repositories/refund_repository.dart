import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class RefundRepository {
  Future<Either<Failure, Transaction>> createRefund({
    required int registerId,
    required int saleId,
    required List<RefundItem> items,
    String? reasonForRefund,
  });
}
