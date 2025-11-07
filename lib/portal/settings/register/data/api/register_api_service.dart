import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_dto.dart';

class RegisterApiService {
  final ApiService _api;

  RegisterApiService({required ApiService api}) : _api = api;

  Future<PaginatedList<RegisterDto>> getRegisters(PageQuery query) async {
    final data = await _api.getPaginated<RegisterDto>(
      ApiEndpoints.registers,
      queryParams: query.toJson(),
      parser: (json) => parse(json, RegisterDto.fromJson),
    );

    return PaginatedList<RegisterDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<RegisterDto> getRegisterById(int id) async {
    final data = await _api.get(
      ApiEndpoints.registerById(id),
      parser: (json) => parse(json, RegisterDto.fromJson),
    );
    return data;
  }

  Future<RegisterDto> createRegister(RegisterPayload payload) async {
    final data = await _api.post(
      ApiEndpoints.registers,
      data: payload.toJson(),
      parser: (json) => parse(json, RegisterDto.fromJson),
    );
    return data;
  }

  Future<RegisterDto> updateRegister(int id, RegisterPayload payload) async {
    final data = await _api.update(
      ApiEndpoints.registerById(id),
      data: payload.toJson(),
      parser: (json) => parse(json, RegisterDto.fromJson),
    );
    return data;
  }

  Future<void> deleteRegister(int id) async {
    return await _api.delete(ApiEndpoints.registerById(id));
  }

  Future<RegisterDto> getRegisterBySerialNo(String serialNo) async {
    final data = await _api.get(
      ApiEndpoints.registerBySerialNo(serialNo),
      parser: (json) => parse(json, RegisterDto.fromJson),
    );
    return data;
  }
}
