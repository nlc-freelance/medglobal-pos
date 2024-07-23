import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';

class CreateSupplierUseCase implements UseCase<void, CreateSupplierParams> {
  final SupplierRepository repository;

  const CreateSupplierUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateSupplierParams params) => repository.create(params.supplier);
}

class CreateSupplierParams {
  final Supplier supplier;

  CreateSupplierParams(this.supplier);
}
