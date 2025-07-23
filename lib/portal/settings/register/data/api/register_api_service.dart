import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register/register_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register/register_dto.dart';

class RegisterApiService {
  final BaseApiService _api;

  RegisterApiService(this._api);

  Future<PaginatedList<RegisterDto>> getRegisters(PageQuery query) async {
    final response = await _api.getPaginated<RegisterDto>(
      ApiEndpoints.registers,
      queryParams: query.toJson(),
      fromJson: RegisterDto.fromJson,
    );

    return PaginatedList<RegisterDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<RegisterDto> getRegisterById(int id) async {
    final response = await _api.get(
      ApiEndpoints.registerById(id),
      fromJson: RegisterDto.fromJson,
    );
    return response.data;
  }

  Future<RegisterDto> createRegister(RegisterPayload payload) async {
    final response = await _api.post(
      ApiEndpoints.registers,
      data: payload.toJson(),
      fromJson: RegisterDto.fromJson,
    );
    return response.data;
  }

  Future<RegisterDto> updateRegister(int id, RegisterPayload payload) async {
    final response = await _api.update(
      ApiEndpoints.registerById(id),
      data: payload.toJson(),
      fromJson: RegisterDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteRegister(int id) async {
    return await _api.delete(ApiEndpoints.registerById(id));
  }
}
