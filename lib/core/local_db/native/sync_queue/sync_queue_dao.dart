import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/native/sync_queue/sync_queue_table.dart';

part 'sync_queue_dao.g.dart';

@DriftAccessor(tables: [SyncQueue])
class SyncQueueDao extends DatabaseAccessor<AppDatabase> with _$SyncQueueDaoMixin {
  SyncQueueDao(super.db);

  /// Insert a new entry to the sync queue.
  Future<int> enqueue(SyncQueueCompanion entry) {
    return into(syncQueue).insert(entry);
  }

  /// Get all pending items from the queue.
  Future<List<SyncQueueData>> getPendingQueueItems({int limit = 50}) {
    return (select(syncQueue)
          ..where((tbl) => tbl.status.equals('pending'))
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]))
        .get();
  }

  /// Get all failed items from the queue.
  Future<List<SyncQueueData>> getFailedQueueItems({int limit = 50}) {
    return (select(syncQueue)
          ..where((tbl) => tbl.status.equals('failed'))
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]))
        .get();
  }

  /// Update the status of a queued item (e.g. to 'synced' or 'failed').
  Future<void> updateQueueItemStatus(int id, String status, {String? error}) async {
    await (update(syncQueue)..where((tbl) => tbl.id.equals(id))).write(
      SyncQueueCompanion(
        status: Value(status),
        errorMessage: Value(error),
      ),
    );
  }

  /// Delete an item from the queue after successful sync.
  Future<void> deleteQueueItem(int id) {
    return (delete(syncQueue)..where((tbl) => tbl.id.equals(id))).go();
  }
}
