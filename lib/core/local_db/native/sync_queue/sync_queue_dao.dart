import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/native/sync_queue/sync_queue_table.dart';

part 'sync_queue_dao.g.dart';

@DriftAccessor(tables: [SyncQueue])
class SyncQueueDao extends DatabaseAccessor<AppDatabase> with _$SyncQueueDaoMixin {
  SyncQueueDao(super.db);

  /// Insert a new item to the sync queue.
  Future<int> insertItem(SyncQueueCompanion item) {
    return into(syncQueue).insert(item);
  }

  /// Get all pending items from the queue.
  Future<List<SyncQueueData>> getPendingItems() {
    return (select(syncQueue)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.createdAt),
          ]))
        .get();
  }

  /// Update the error of a queued item
  Future<SyncQueueData?> updateError(int id, String errorMessage) async {
    await (update(syncQueue)..where((tbl) => tbl.id.equals(id))).write(
      SyncQueueCompanion(lastError: Value(errorMessage)),
    );

    return (select(syncQueue)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Delete an item from the queue after successful sync
  Future<void> deleteItem(int id) async {
    await (delete(syncQueue)..where((tbl) => tbl.id.equals(id))).go();
  }
}

// extension SyncQueueMapper on RegisterShift {
//   SyncQueueCompanion toDriftCompanion() => SyncQueueCompanion.insert(
//         userId: userId,
//
//       );
// }

class SyncQueueMapper {
  SyncQueueMapper._();

  static SyncQueueCompanion toSyncQueueItem({
    required int itemId,
    required int userId,
    required String table,
    required Map<String, dynamic> data,
  }) {
    return SyncQueueCompanion.insert(
      itemId: itemId,
      userId: userId,
      table: table,
      data: jsonEncode(data),
    );
  }
}
