import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/login_response.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/repositories/auth_repository.dart';

class ConfirmFirstTimeLogin implements UseCase<LoginResponse, ConfirmFirstTimeLoginParams> {
  final AuthRepository repository;

  ConfirmFirstTimeLogin(this.repository);

  @override
  Future<ApiResult<LoginResponse>> call(ConfirmFirstTimeLoginParams params) =>
      repository.confirmFirstTimeLogin(params.password);
}

class ConfirmFirstTimeLoginParams {
  final String password;

  ConfirmFirstTimeLoginParams(this.password);
}
