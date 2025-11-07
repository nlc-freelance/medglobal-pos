import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';

abstract class AppSessionRepository {
  Future<ApiResult<void>> saveSession(User user);
  Future<ApiResult<User?>> getActiveSession();
  Future<ApiResult<void>> clearSession();
}
