import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';

abstract class AppSessionRepository {
  Future<Either<Failure, void>> saveSession(AppSession session);
  Future<Either<Failure, AppSession?>> getActiveSession();
  Future<Either<Failure, void>> clearSession();
}
