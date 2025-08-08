import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/entities/receipt_configuration.dart';

abstract class LocalReceiptConfigRepository {
  Future<Either<Failure, void>> upsertReceiptConfig(ReceiptConfiguration config);
  Future<Either<Failure, void>> clearReceiptConfig();
}
