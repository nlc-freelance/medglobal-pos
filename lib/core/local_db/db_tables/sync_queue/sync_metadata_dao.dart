import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';

part 'sync_metadata_dao.g.dart';

@DriftAccessor(tables: [SyncMetadata])
class SyncMetadataDao extends DatabaseAccessor<AppDatabase> with _$SyncMetadataDaoMixin, BaseDao {
  SyncMetadataDao(super.db);

  Future<DateTime?> getLastSyncTime(String tableName) async {
    final row = await (select(syncMetadata)..where((tbl) => tbl.table.equals(tableName))).getSingleOrNull();
    return row?.lastSyncTime;
  }

  Future<void> updateLastSyncedAt(String tableName) {
    return safeCall(() async {
      await into(syncMetadata).insertOnConflictUpdate(
        SyncMetadataCompanion(
          table: Value(tableName),
          lastSyncTime: Value(DateTime.now()),
        ),
      );
    });
  }
}

// extension SyncQeueueMapper on SyncQueueItem {
//   SyncQueueCompanion toDriftCompanion() {
//     return SyncQueueCompanion.insert(
//       table: tableName,
//       data: payload,
//       status: status,
//       itemId: atus,
//       userId: null,
//     );
//   }
// }
