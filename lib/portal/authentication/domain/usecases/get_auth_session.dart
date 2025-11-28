import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/login_response.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/repositories/auth_repository.dart';

class GetAuthSession implements UseCase<LoginResponse, NoParams> {
  final AuthRepository repository;

  GetAuthSession(this.repository);

  @override
  Future<ApiResult<LoginResponse>> call(_) => repository.getAuthSession();
}
