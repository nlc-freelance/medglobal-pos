import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

abstract class RegisterRepository {
  /// Retrieves a list of all POS registers
  Future<Either<Failure, PaginatedList<Register>>> getRegisters({required PageQuery filters});

  /// Retrieves a POS register by id
  Future<Either<Failure, Register>> getRegister(int id);

  /// Creates a new POS register
  Future<Either<Failure, Register>> createRegister(Register tax);

  /// Updates an existing POS register
  Future<Either<Failure, Register>> updateRegister(Register tax);

  /// Deletes a POS register
  Future<Either<Failure, void>> deleteRegister(int id);
}
