import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/login_response.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponse>> login(String email, String password);
  Future<ApiResult<LoginResponse>> confirmFirstTimeLogin(String password);
  Future<ApiResult<LoginResponse>> getAuthSession();
  Future<ApiResult<void>> logout();
}
