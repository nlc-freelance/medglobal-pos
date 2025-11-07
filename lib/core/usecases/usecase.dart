import 'package:medglobal_admin_portal/core/network/network.dart';

abstract class UseCase<Type, Params> {
  Future<ApiResult<Type>> call(Params params);
}

class NoParams {}
