import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

abstract class LocalSettingsRepository {
  Future<ApiResult<void>> saveRegister(Register register);

  Future<ApiResult<void>> saveReceiptConfig(ReceiptConfiguration config);

  Future<ApiResult<void>> savePrinter(String name);

  Future<ApiResult<DeviceSettings?>> getSettings();
}
