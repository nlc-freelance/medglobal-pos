import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_paginated_list.dart';
import 'package:medglobal_admin_portal/shared/register/domain/repositories/register_repository.dart';

class GetRegistersUseCase implements UseCase<RegisterPaginatedList, GetRegistersParams> {
  final RegisterRepository repository;

  const GetRegistersUseCase(this.repository);

  @override
  Future<Either<Failure, RegisterPaginatedList>> call(GetRegistersParams params) => repository.getRegisters(
        page: params.page,
      );
}

class GetRegistersParams {
  final int page;
  final String? search;

  GetRegistersParams({required this.page, this.search});
}
