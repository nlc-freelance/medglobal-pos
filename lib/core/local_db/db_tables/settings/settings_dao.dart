import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/settings/settings_table.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor<AppDatabase> with _$SettingsDaoMixin, BaseDao {
  SettingsDao(super.db);

  Future<SettingsModel?> getPrinter() {
    return safeCall(() async {
      return await (select(settings)..limit(1)).getSingleOrNull();
    });
  }

  Future<void> upsertPrinter(String name) {
    return safeCall(() async {
      await into(settings).insertOnConflictUpdate(
        SettingsCompanion(printer: Value(name)),
      );
    });
  }

  Future<void> clearSettings() async {
    return safeCall(() async {
      await delete(settings).go();
    });
  }
}
