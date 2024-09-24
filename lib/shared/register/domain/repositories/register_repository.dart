import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_paginated_list.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterPaginatedList>> getRegisters({required int page});
}
