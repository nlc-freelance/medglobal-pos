import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/pos/app_session/data/datasources/app_session_datasource.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/repository/app_session_repository.dart';

class AppSessionRepositoryImpl extends BaseRepository implements AppSessionRepository {
  final AppSessionDataSource _localDataSource;

  AppSessionRepositoryImpl({required AppSessionDataSource localDataSource}) : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, void>> saveSession(User session) {
    return call(() async {
      return await _localDataSource.saveSession(session);
    });
  }

  @override
  Future<Either<Failure, void>> clearSession() {
    return call(() async {
      return await _localDataSource.clearSession();
    });
  }

  @override
  Future<Either<Failure, User?>> getActiveSession() {
    return call(() async {
      final session = await _localDataSource.getActiveSession();
      return session?.toEntity();
    });
  }
}
