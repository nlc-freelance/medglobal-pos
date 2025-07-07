import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/request/create_register_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/request/update_register_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/response/register_dto.dart';

class RegisterApi {
  final BaseApiService _api;

  RegisterApi(this._api);

  Future<PaginatedList<RegisterDto>> getRegisters({required PageQuery filters}) async {
    final response = await _api.getPaginated<RegisterDto>(
      ApiEndpoints.registers,
      queryParams: filters.toJson(),
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

  Future<RegisterDto> createRegister(CreateRegisterDto dto) async {
    final response = await _api.post(
      ApiEndpoints.registers,
      data: dto.toJson(),
      fromJson: RegisterDto.fromJson,
    );
    return response.data;
  }

  Future<RegisterDto> updateRegister(UpdateRegisterDto dto) async {
    final response = await _api.update(
      ApiEndpoints.registerById(dto.id),
      data: dto.toJson(),
      fromJson: RegisterDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteRegister(int id) async {
    return await _api.delete(ApiEndpoints.registerById(id));
  }
}
