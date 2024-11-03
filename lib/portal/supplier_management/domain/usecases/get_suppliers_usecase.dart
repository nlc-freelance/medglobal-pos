import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';

class GetSuppliersUseCase implements UseCase<SupplierPaginatedList, GetSuppliersParams> {
  final SupplierRepository repository;

  const GetSuppliersUseCase(this.repository);

  @override
  Future<Either<Failure, SupplierPaginatedList>> call(GetSuppliersParams params) =>
      repository.getSuppliers(page: params.page, size: params.size, search: params.search);
}

class GetSuppliersParams {
  final int page;
  final int size;
  final String? search;

  GetSuppliersParams({required this.page, required this.size, this.search});
}
