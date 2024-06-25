import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';

class CreateSupplier implements UseCase<void, CreateSupplierParams> {
  final SupplierRepository repository;

  const CreateSupplier(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateSupplierParams params) => repository.create(params.supplier);
}

class CreateSupplierParams {
  final Supplier supplier;

  CreateSupplierParams(this.supplier);
}
