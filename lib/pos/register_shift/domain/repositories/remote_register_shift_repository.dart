import 'package:medglobal_admin_portal/core/network/network.dart';

abstract class RemoteRegisterShiftRepository {
  Future<ApiResult<void>> sendShift(Map<String, dynamic> payload);
  // Future<Either<Failure, void>> sendShift(RegisterShift shift);
}
