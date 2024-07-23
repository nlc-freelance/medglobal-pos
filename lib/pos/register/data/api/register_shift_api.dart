import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift.dart';

abstract class RegisterShiftApi {
  Future<void> openShift(RegisterShift shift);
  Future<void> closeShift(RegisterShift shift);
}

class RegisterShiftApiImpl implements RegisterShiftApi {
  final ApiService _apiService;

  RegisterShiftApiImpl(this._apiService);

  @override
  Future<void> openShift(RegisterShift shift) async {
    try {
      await _apiService.post(
        '/shifts',
        data: shift.toJson(),
        converter: (response) => response,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> closeShift(RegisterShift shift) async {
    try {
      await _apiService.post(
        '/shifts',
        data: shift.toJson(),
        converter: (response) => response,
      );
    } catch (_) {
      rethrow;
    }
  }
}
