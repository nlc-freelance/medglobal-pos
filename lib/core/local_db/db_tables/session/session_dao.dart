import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';

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
extension SessionMapper on User {
  SessionCompanion toSessionCompanion() {
    return SessionCompanion.insert(
      userId: id!,
      userFirstName: firstName!,
      userLastName: lastName!,
      userRole: type!.name,
      // registerId: registerId,
      // registerName: registerName,
      // registerSerialNo: registerSerialNo,
      // branchId: branchId,
      // branchName: branchName,
      // receiptConfig: jsonEncode(receiptConfig.toJson()),
    );
  }
}

// extension SessionDataMapper on SessionData {
//   AppSession toEntity() {
//     return AppSession(
//       employeeId: employeeId,
//       employeeFirstName: employeeFirstName,
//       employeeLastName: employeeLastName,
//       registerId: registerId,
//       registerName: registerName,
//       registerSerialNo: registerSerialNo,
//       branchId: branchId,
//       branchName: branchName,
//       receiptConfig: jsonDecode(receiptConfig),
//     );
//   }

extension SessionDataMapper on SessionData {
  User toEntity() {
    return User(
      id: userId,
      firstName: userFirstName,
      lastName: userLastName,
      type: UserType.fromString(userRole),
    );
  }
}
