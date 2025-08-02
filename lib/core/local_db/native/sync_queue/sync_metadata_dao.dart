import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/native/sync_queue/sync_metadata_table.dart';
import 'package:medglobal_admin_portal/pos/sync/sync_queue_item.dart';

part 'sync_metadata_dao.g.dart';

@DriftAccessor(tables: [SyncMetadata])
class SyncMetadataDao extends DatabaseAccessor<AppDatabase> with _$SyncMetadataDaoMixin {
  SyncMetadataDao(super.db);

  Future<DateTime?> getLastSyncTime(String tableName) async {
    final row = await (select(syncMetadata)..where((tbl) => tbl.table.equals(tableName))).getSingleOrNull();
    return row?.lastSyncTime;
  }

  Future<void> updateLastSyncTime(String tableName, DateTime time) async {
    await into(syncMetadata).insertOnConflictUpdate(
      SyncMetadataCompanion(
        table: Value(tableName),
        lastSyncTime: Value(time),
      ),
    );
  }
}

extension SyncQeueueMapper on SyncQueueItem {
  SyncQueueCompanion toDriftCompanion() {
    return SyncQueueCompanion.insert(
      table: tableName,
      payload: payload,
      action: action,
      status: status,
    );
  }
}
