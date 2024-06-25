import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/entities/login_response.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/repositories/auth_repository.dart';

class ConfirmFirstTimeLogin implements UseCase<LoginResponse, ConfirmFirstTimeLoginParams> {
  final AuthRepository repository;

  ConfirmFirstTimeLogin(this.repository);

  @override
  Future<Either<Failure, LoginResponse>> call(ConfirmFirstTimeLoginParams params) =>
      repository.confirmFirstTimeLogin(params.password);
}

class ConfirmFirstTimeLoginParams {
  final String password;

  ConfirmFirstTimeLoginParams(this.password);
}
