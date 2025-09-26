import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

abstract class RemoteReceiptConfigRepository {
  Future<Either<Failure, ReceiptConfiguration>> getReceiptConfigByBranch(int id, {int? lastSynced});
}
