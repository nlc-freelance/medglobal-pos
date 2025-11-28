import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/settings/local_settings_repository.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

/// Concrete implementation of [LocalSettingsRepository] that uses [AppDatabase] for API calls
/// and [BaseRepository] to centralize error handling.
class LocalSettingsRepositoryImpl extends BaseRepository implements LocalSettingsRepository {
  final SettingsDao _dao;

  LocalSettingsRepositoryImpl({required SettingsDao dao}) : _dao = dao;

  @override
  Future<ApiResult<void>> saveRegister(Register register) {
    return call(() async {
      return await _dao.upsertRegisterAndBranch(register);
    });
  }

  @override
  Future<ApiResult<void>> savePrinter(String name) {
    return call(() async {
      return await _dao.upsertPrinter(name);
    });
  }

  @override
  Future<ApiResult<void>> saveReceiptConfig(ReceiptConfiguration config) {
    return call(() async {
      return await _dao.upsertReceiptConfig(config);
    });
  }

  @override
  Future<ApiResult<DeviceSettings?>> getSettings() {
    return call(() async {
      final settings = await _dao.getSettings();
      if (settings == null) return null;
      return settings.toEntity();
    });
  }
}
