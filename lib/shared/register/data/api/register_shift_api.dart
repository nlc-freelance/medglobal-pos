import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/shared/register/data/dto/register_shift_dto.dart';
import 'package:medglobal_admin_portal/shared/register/data/dto/register_shift_request_dto.dart';

abstract class RegisterShiftApi {
  Future<RegisterShiftDto> shift(RegisterShiftRequestDto request);
}

class RegisterShiftApiImpl implements RegisterShiftApi {
  final ApiService _apiService;

  RegisterShiftApiImpl(this._apiService);

  @override
  Future<RegisterShiftDto> shift(RegisterShiftRequestDto request) async {
    try {
      return await _apiService.post(
        '/shifts',
        data: request.toJson(),
        converter: RegisterShiftDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
}
