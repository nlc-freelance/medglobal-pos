import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

abstract class RegisterRepository {
  /// Retrieves a list of all POS registers
  Future<ApiResult<PaginatedList<Register>>> getRegisters(PageQuery query);

  /// Retrieves a POS register by id
  Future<ApiResult<Register>> getRegister(int id);

  /// Creates a new POS register
  Future<ApiResult<Register>> createRegister(RegisterPayload payload);

  /// Updates an existing POS register
  Future<ApiResult<Register>> updateRegister(int id, RegisterPayload payload);

  /// Deletes a POS register
  Future<ApiResult<void>> deleteRegister(int id);

  /// Retrieves a POS register by serial number
  Future<ApiResult<Register>> getRegisterBySerialNo();
}
