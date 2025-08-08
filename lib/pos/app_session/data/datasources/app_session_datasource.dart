import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/session/session_dao.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';

class AppSessionDataSource {
  final SessionDao _dao;

  AppSessionDataSource({required SessionDao dao}) : _dao = dao;

  Future<void> saveSession(AppSession session) async {
    return await _dao.insertSession(session.toSessionCompanion());
  }

  Future<SessionData?> getActiveSession() async {
    return await _dao.getActiveSession();
  }

  Future<void> clearSession() async {
    return await _dao.clearSession();
  }
}
