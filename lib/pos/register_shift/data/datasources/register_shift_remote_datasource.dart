import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_dto.dart';

class RegisterShiftRemoteDataSource {
  final BaseApiService _api;

  RegisterShiftRemoteDataSource(this._api);

  Future<RegisterShiftDto> openOrCloseShift(Map<String, dynamic> payload) async {
    final response = await _api.post(
      ApiEndpoints.registerShift,
      data: payload,
      fromJson: RegisterShiftDto.fromJson,
    );

    return response.data;
  }
}
