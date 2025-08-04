import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/native/session/session_table.dart';
import 'package:medglobal_admin_portal/pos/pos_session/domain/entities/pos_session.dart';

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
  Future<SessionData?> getActiveSession() async {
    // return safeCall(() async {
    return await (select(session)..limit(1)).getSingleOrNull();
    // });
  }

  // Clear PosSession on logout
  Future<void> clearSession() async {
    // return safeCall(() async {
    await delete(session).go();
    // });
  }
}

/// Mappers
extension SessionMapper on PosSession {
  SessionCompanion toDriftCompanion() {
    return SessionCompanion.insert(
      employeeId: employeeId,
      employeeFirstName: employeeFirstName,
      employeeLastName: employeeLastName,
      registerId: registerId,
      registerName: registerName,
      registerSerialNo: registerSerialNo,
      branchId: branchId,
      branchName: branchName,
    );
  }
}

extension SessionDataMapper on SessionData {
  PosSession toDomain() {
    return PosSession(
      employeeId: employeeId,
      employeeFirstName: employeeFirstName,
      employeeLastName: employeeLastName,
      registerId: registerId,
      registerName: registerName,
      registerSerialNo: registerSerialNo,
      branchId: branchId,
      branchName: branchName,
      loginTime: null,
    );
  }
}
