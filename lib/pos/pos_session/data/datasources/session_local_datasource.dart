// import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
// import 'package:medglobal_admin_portal/core/local_db/native/session/session_dao.dart';
// import 'package:medglobal_admin_portal/pos/pos_session/domain/entities/pos_session.dart';
// import 'package:medglobal_admin_portal/pos/pos_session/data/mappers/session_mapper.dart';

// class SessionLocalDataSource {
//   final PosSessionDao _dao;

//   SessionLocalDataSource({required PosSessionDao dao}) : _dao = dao;

//   Future<void> saveSession(Session session) async {
//     return await _dao.setSession(session.toDriftCompanion());
//   }

//   Future<PosSessionData?> getActiveSession() async {
//     return await _dao.getActiveSession();
//   }

//   Future<void> clearSession() async {
//     return await _dao.clearSession();
//   }
// }
