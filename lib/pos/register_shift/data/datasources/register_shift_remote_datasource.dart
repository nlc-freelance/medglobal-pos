import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/dto/register_shift_dto.dart';

class RegisterShiftRemoteDataSource {
  final ApiService _api;

  RegisterShiftRemoteDataSource({required ApiService api}) : _api = api;

  Future<RegisterShiftDto> openOrCloseShift(Map<String, dynamic> payload) async {
    final data = await _api.post(
      ApiEndpoints.registerShift,
      data: payload,
      parser: (json) => parse(json, RegisterShiftDto.fromJson),
    );

    return data;
  }
}
