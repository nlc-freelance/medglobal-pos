import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';

class GetSupplierById implements UseCase<Supplier, GetSupplierByIdParams> {
  final SupplierRepository repository;

  const GetSupplierById(this.repository);

  @override
  Future<Either<Failure, Supplier>> call(GetSupplierByIdParams params) => repository.getSupplierById(params.id);
}

class GetSupplierByIdParams {
  final int id;

  GetSupplierByIdParams(this.id);
}
