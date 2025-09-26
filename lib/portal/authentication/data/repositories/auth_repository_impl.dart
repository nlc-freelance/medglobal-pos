import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_api.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/login_response.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl(this.authApi);

  @override
  Future<Either<Failure, LoginResponse>> confirmFirstTimeLogin(String password) async {
    try {
      final response = await authApi.confirmLoginWithNewPassword(password);
      return Right(response.toEntity());
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login(String email, String password) async {
    try {
      final response = await authApi.login(email, password);
      return Right(response.toEntity());
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> getAuthSession() async {
    try {
      final response = await authApi.getAuthSession();
      return Right(response.toEntity());
    } catch (e) {
      if (e is NotAuthorizedServiceException) return Left(ExpiredTokenFailure(e.message));
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return Right(await authApi.logout());
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
