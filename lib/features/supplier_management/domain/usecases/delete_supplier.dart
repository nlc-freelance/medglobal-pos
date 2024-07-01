import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';

class DeleteSupplierUseCase implements UseCase<void, DeleteSupplierParams> {
  final SupplierRepository repository;

  const DeleteSupplierUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteSupplierParams params) => repository.delete(params.id);
}

class DeleteSupplierParams {
  final int id;

  DeleteSupplierParams(this.id);
}
