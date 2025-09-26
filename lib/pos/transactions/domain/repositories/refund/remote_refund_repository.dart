import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

abstract class RemoteRefundRepository {
  Future<Either<Failure, Transaction>> createRefund(CreateRefundDto payload);
}
