import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/response/register_shift_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/request/create_register_shift_dto.dart';

abstract class RegisterShiftApi {
  Future<RegisterShiftDto> shift(CreateRegisterShiftDto request);
}

class RegisterShiftApiImpl implements RegisterShiftApi {
  final ApiService _apiService;

  RegisterShiftApiImpl(this._apiService);

  @override
  Future<RegisterShiftDto> shift(CreateRegisterShiftDto request) async {
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
