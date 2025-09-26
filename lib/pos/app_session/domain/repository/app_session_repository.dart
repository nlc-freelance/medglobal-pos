import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';

abstract class AppSessionRepository {
  Future<Either<Failure, void>> saveSession(User user);
  Future<Either<Failure, User?>> getActiveSession();
  Future<Either<Failure, void>> clearSession();
}
