import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';

class SyncQueueRepository {
  final SyncQueueDao _dao;
  final AppSessionService _session;

  SyncQueueRepository({
    required SyncQueueDao dao,
    required AppSessionService session,
  })  : _dao = dao,
        _session = session;

  Future<void> enqueue({
    required String table,
    required int itemId,
    required Map<String, dynamic> data,
    String? error,
  }) async {
    final userId = _session.userId;

    if (userId == null) {
      throw UnexpectedException('Add to sync queue failed: No valid user in context.');
    }

    final item = SyncQueueCompanion(
      userId: Value(userId),
      itemId: Value(itemId),
      table: Value(table),
      data: Value(jsonEncode(data)),
      lastError: Value(error),
    );

    await _dao.insertItem(item);
  }

  Future<List<SyncQueueData>> getPendingItemsByUser() {
    final userId = _session.userId;

    if (userId == null) {
      throw UnexpectedException('Get pending items by user failed: No valid user in context.');
    }

    return _dao.getPendingItemsByUser(userId);
  }

  Future<void> removeItem(int id) {
    return _dao.deleteItem(id);
  }

  // Future<void> updateError(int id, String error) {
  //   return _dao.updateError(id, error);
  // }
}
