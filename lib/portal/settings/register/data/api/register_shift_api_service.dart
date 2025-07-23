import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_payload.dart';

class RegisterShiftApiService {
  final BaseApiService _api;

  RegisterShiftApiService(this._api);

  Future<RegisterShiftDto> openCloseShift(RegisterShiftPayload payload) async {
    final response = await _api.post(
      ApiEndpoints.registerShift,
      data: payload.toJson(),
      fromJson: RegisterShiftDto.fromJson,
    );

    return response.data;
  }
}
