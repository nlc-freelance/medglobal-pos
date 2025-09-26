import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/local_settings_repository.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

/// Concrete implementation of [LocalSettingsRepository] that uses [AppDatabase] for API calls
/// and [BaseRepository] to centralize error handling.
class LocalSettingsRepositoryImpl extends BaseRepository implements LocalSettingsRepository {
  final SettingsDao _dao;

  LocalSettingsRepositoryImpl({required SettingsDao dao}) : _dao = dao;

  @override
  Future<Either<Failure, void>> saveRegister(Register register) {
    return call(() async {
      return await _dao.upsertRegisterAndBranch(register);
    });
  }

  @override
  Future<Either<Failure, void>> savePrinter(String name) {
    return call(() async {
      return await _dao.upsertPrinter(name);
    });
  }

  @override
  Future<Either<Failure, void>> saveReceiptConfig(ReceiptConfiguration config) {
    return call(() async {
      return await _dao.upsertReceiptConfig(config);
    });
  }

  @override
  Future<Either<Failure, DeviceSettings?>> getSettings() {
    return call(() async {
      final settings = await _dao.getSettings();
      if (settings == null) return null;
      return settings.toEntity();
    });
  }
}
