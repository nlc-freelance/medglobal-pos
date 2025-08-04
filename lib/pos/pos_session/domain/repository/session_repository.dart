import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/pos/pos_session/domain/entities/pos_session.dart';

abstract class SessionRepository {
  Future<Either<Failure, void>> saveSession(PosSession session);

  Future<Either<Failure, PosSession?>> getActiveSession();

  Future<Either<Failure, void>> clearSession();
}
