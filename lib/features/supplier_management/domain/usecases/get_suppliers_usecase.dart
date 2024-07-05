import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier_list.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';

class GetSuppliersUseCase implements UseCase<SupplierPaginatedList, GetSuppliersParams> {
  final SupplierRepository repository;

  const GetSuppliersUseCase(this.repository);

  @override
  Future<Either<Failure, SupplierPaginatedList>> call(GetSuppliersParams params) =>
      repository.getSuppliers(params.page);
}

class GetSuppliersParams {
  final int page;

  GetSuppliersParams(this.page);
}
