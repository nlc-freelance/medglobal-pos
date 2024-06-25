import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/entities/login_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(String email, String password);
  Future<Either<Failure, LoginResponse>> confirmFirstTimeLogin(String password);
  Future<Either<Failure, LoginResponse>> getAuthSession();
  Future<Either<Failure, void>> logout();
}
