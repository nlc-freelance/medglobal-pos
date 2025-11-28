import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/pos/app_session/data/datasources/app_session_datasource.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/repository/app_session_repository.dart';

/// Concrete implementation of [AppSessionRepository] that uses [AppSessionDataSource] for local DB queries
/// and [BaseRepository] to centralize error handling.
class AppSessionRepositoryImpl extends BaseRepository implements AppSessionRepository {
  final AppSessionDataSource _localDataSource;

  AppSessionRepositoryImpl({required AppSessionDataSource localDataSource}) : _localDataSource = localDataSource;

  @override
  Future<ApiResult<void>> saveSession(User session) async {
    return call(() async {
      return await _localDataSource.saveSession(session);
    });
  }

  @override
  Future<ApiResult<void>> clearSession() {
    return call(() async {
      return await _localDataSource.clearSession();
    });
  }

  @override
  Future<ApiResult<User?>> getActiveSession() {
    return call(() async {
      final session = await _localDataSource.getActiveSession();
      return session?.toEntity();
    });
  }
}
