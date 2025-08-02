import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/native/session/pos_session_table.dart';
import 'package:medglobal_admin_portal/pos/pos_session/domain/entities/session.dart';

part 'pos_session_dao.g.dart';

@DriftAccessor(tables: [PosSession])
class PosSessionDao extends DatabaseAccessor<AppDatabase> with _$PosSessionDaoMixin {
  PosSessionDao(super.db);

  // Insert or replace session
  Future<void> setSession(PosSessionCompanion session) async {
    // return safeCall(() async {
    await delete(posSession).go(); // always only one session
    await into(posSession).insert(session);
    // });
  }

  // Fetch the active session
  Future<PosSessionData?> getActiveSession() async {
    // return safeCall(() async {
    return await (select(posSession)..limit(1)).getSingleOrNull();
    // });
  }

  // Clear PosSession on logout
  Future<void> clearSession() async {
    // return safeCall(() async {
    await delete(posSession).go();
    // });
  }
}

/// Mappers
extension SessionMapper on Session {
  PosSessionCompanion toDriftCompanion() {
    return PosSessionCompanion.insert(
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

extension SessionDataMapper on PosSessionData {
  Session toDomain() {
    return Session(
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
