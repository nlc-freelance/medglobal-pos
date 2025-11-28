import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class RemoteRefundRepository {
  Future<ApiResult<Transaction>> createRefund(CreateRefundDto payload);
}
