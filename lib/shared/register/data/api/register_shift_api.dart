import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/shared/register/data/dto/register_shift_dto.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';

abstract class RegisterShiftApi {
  Future<RegisterShiftDto> openShift(RegisterShift shift);
  Future<RegisterShiftDto> closeShift(RegisterShift shift);
}

class RegisterShiftApiImpl implements RegisterShiftApi {
  final ApiService _apiService;

  RegisterShiftApiImpl(this._apiService);

  @override
  Future<RegisterShiftDto> openShift(RegisterShift shift) async {
    try {
      return await _apiService.post(
        '/shifts',
        data: shift.toJson(),
        converter: RegisterShiftDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterShiftDto> closeShift(RegisterShift shift) async {
    try {
      return await _apiService.post(
        '/shifts',
        data: shift.toJson(),
        converter: RegisterShiftDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }
}
