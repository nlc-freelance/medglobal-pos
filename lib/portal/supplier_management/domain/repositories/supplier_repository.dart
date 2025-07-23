import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

abstract class SupplierRepository {
  Future<Either<Failure, PaginatedList<Supplier>>> getSuppliers(PageQuery query);
  Future<Either<Failure, Supplier>> getSupplierById(int id);
  Future<Either<Failure, void>> create(Supplier supplier);
  Future<Either<Failure, void>> update(int id, Supplier supplier);
  Future<Either<Failure, void>> delete(int id);
}
