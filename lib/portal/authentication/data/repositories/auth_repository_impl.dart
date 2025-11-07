import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_api.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/login_response.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl(this.authApi);

  @override
  Future<ApiResult<LoginResponse>> confirmFirstTimeLogin(String password) async {
    try {
      final response = await authApi.confirmLoginWithNewPassword(password);
      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<LoginResponse>> login(String email, String password) async {
    try {
      final response = await authApi.login(email, password);
      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<LoginResponse>> getAuthSession() async {
    try {
      final response = await authApi.getAuthSession();
      return ApiResult.success(response.toEntity());
    } catch (e) {
      if (e is NotAuthorizedServiceException) return ApiResult.failure(ExpiredTokenFailure(e.message));
      return ApiResult.failure(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
      return ApiResult.success(await authApi.logout());
    } catch (e) {
      return ApiResult.failure(AuthenticationFailure(e.toString()));
    }
  }
}
