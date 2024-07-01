import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';

class UpdateSupplierUseCase implements UseCase<void, UpdateSupplierParams> {
  final SupplierRepository repository;

  const UpdateSupplierUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateSupplierParams params) => repository.update(params.id, params.supplier);
}

class UpdateSupplierParams {
  final Supplier supplier;
  final int id;

  UpdateSupplierParams(this.supplier) : id = supplier.id!;
}
