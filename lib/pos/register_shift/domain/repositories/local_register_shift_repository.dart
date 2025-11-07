import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';

abstract class LocalRegisterShiftRepository {
  Future<ApiResult<RegisterShift>> openShift(RegisterShift shift);

  Future<ApiResult<RegisterShift?>> getOpenShift(int registerId);

  Future<ApiResult<RegisterShift>> closeShift(int shiftId, double amount);

  Future<ApiResult<RegisterShift?>> getLastClosedShift(int registerId);

  Future<ApiResult<RegisterShift>> getShiftById(int id);
}
