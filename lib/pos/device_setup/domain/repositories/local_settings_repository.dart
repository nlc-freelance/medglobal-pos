import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

abstract class LocalSettingsRepository {
  Future<Either<Failure, void>> saveRegister(Register register);
  Future<Either<Failure, void>> saveReceiptConfig(ReceiptConfiguration config);
  Future<Either<Failure, void>> savePrinter(String name);
  Future<Either<Failure, DeviceSettings?>> getSettings();
}
