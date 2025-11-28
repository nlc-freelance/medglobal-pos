import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class RemoteSaleRepository {
  Future<ApiResult<Transaction>> createSale(Map<String, dynamic> payload);
  // Future<Either<Failure, Transaction>> createSale(OrderPayload payload);
}
