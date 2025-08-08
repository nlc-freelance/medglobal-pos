import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';

part 'session_dao.g.dart';

@DriftAccessor(tables: [Session])
class SessionDao extends DatabaseAccessor<AppDatabase> with _$SessionDaoMixin, BaseDao {
  SessionDao(super.db);

  // Insert or replace session
  Future<void> insertSession(SessionCompanion posSession) async {
    return safeCall(() async {
      await delete(session).go(); // always only one session
      await into(session).insert(posSession);
    });
  }

  // Fetch the active session
  Future<SessionData?> getActiveSession() {
    return safeCall(() async {
      return await (select(session)..limit(1)).getSingleOrNull();
    });
  }

  // Clear AppSession on logout
  Future<void> clearSession() async {
    return safeCall(() async {
      await delete(session).go();
    });
  }
}

/// Mappers
extension SessionMapper on AppSession {
  SessionCompanion toSessionCompanion() {
    return SessionCompanion.insert(
      employeeId: employeeId,
      employeeFirstName: employeeFirstName,
      employeeLastName: employeeLastName,
      registerId: registerId,
      registerName: registerName,
      registerSerialNo: registerSerialNo,
      branchId: branchId,
      branchName: branchName,
      receiptConfig: jsonEncode(receiptConfig.toJson()),
    );
  }
}

extension SessionDataMapper on SessionData {
  AppSession toEntity() {
    return AppSession(
      employeeId: employeeId,
      employeeFirstName: employeeFirstName,
      employeeLastName: employeeLastName,
      registerId: registerId,
      registerName: registerName,
      registerSerialNo: registerSerialNo,
      branchId: branchId,
      branchName: branchName,
      receiptConfig: jsonDecode(receiptConfig),
    );
  }
}
