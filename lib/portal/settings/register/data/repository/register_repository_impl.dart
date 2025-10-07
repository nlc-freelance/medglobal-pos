import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/contexts/device_uuid.dart';

/// Concrete implementation of [RegisterRepository] that uses [RegisterApiService] for API calls
/// and [BaseRepository] to centralize error handling.
class RegisterRepositoryImpl extends BaseRepository implements RegisterRepository {
  final RegisterApiService _api;

  RegisterRepositoryImpl({required RegisterApiService api}) : _api = api;

  @override
  Future<ApiResult<PaginatedList<Register>>> getRegisters(PageQuery query) async {
    return call(() async {
      final response = await _api.getRegisters(query);
      final paginatedRegisters = response.convert((dto) => RegisterMapper.fromDto(dto));

      return paginatedRegisters;
    });
  }

  @override
  Future<ApiResult<Register>> getRegister(int id) async {
    return call(() async {
      final response = await _api.getRegisterById(id);
      return RegisterMapper.fromDto(response);
    });
  }

  @override
  Future<ApiResult<Register>> createRegister(RegisterPayload payload) async {
    return call(() async {
      final response = await _api.createRegister(payload);
      return RegisterMapper.fromDto(response);
    });
  }

  @override
  Future<ApiResult<Register>> updateRegister(int id, RegisterPayload payload) async {
    return call(() async {
      final response = await _api.updateRegister(id, payload);
      return RegisterMapper.fromDto(response);
    });
  }

  @override
  Future<ApiResult<void>> deleteRegister(int id) async {
    return call(() async => await _api.deleteRegister(id));
  }

  @override
  Future<ApiResult<Register>> getRegisterBySerialNo() {
    return call(() async {
      final uuid = await getDeviceUUID();

      if (uuid == null) {
        throw UnexpectedException('Could not fetch device ID.');
      }

      final response = await _api.getRegisterBySerialNo(uuid);
      return RegisterMapper.fromDto(response);
    });
  }
}
