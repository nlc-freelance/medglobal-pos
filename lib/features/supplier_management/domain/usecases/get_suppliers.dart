import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';

class GetSuppliers implements UseCase<List<Supplier>, GetSuppliersParams> {
  final SupplierRepository repository;

  const GetSuppliers(this.repository);

  @override
  Future<Either<Failure, List<Supplier>>> call(GetSuppliersParams params) => repository.getSuppliers(params.page);
}

class GetSuppliersParams {
  final int page;

  GetSuppliersParams(this.page);
}
