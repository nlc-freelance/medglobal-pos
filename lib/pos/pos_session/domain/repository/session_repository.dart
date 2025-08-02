import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/pos/pos_session/domain/entities/session.dart';

abstract class SessionRepository {
  Future<Either<Failure, void>> saveSession(Session session);

  Future<Either<Failure, Session?>> getActiveSession();

  Future<Either<Failure, void>> clearSession();
}
