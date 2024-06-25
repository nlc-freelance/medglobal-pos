import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/entities/login_response.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/repositories/auth_repository.dart';

class Login implements UseCase<LoginResponse, LoginParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginParams params) => repository.login(params.email, params.password);
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams(
    this.email,
    this.password,
  );
}
