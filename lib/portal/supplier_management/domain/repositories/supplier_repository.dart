import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_payload.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

abstract class SupplierRepository {
  Future<Either<Failure, PaginatedList<Supplier>>> getSuppliers(PageQuery query);
  Future<Either<Failure, Supplier>> getSupplierById(int id);
  Future<Either<Failure, Supplier>> createSupplier(SupplierPayload payload);
  Future<Either<Failure, Supplier>> updateSupplier(int id, SupplierPayload payload);
  Future<Either<Failure, void>> deleteSupplier(int id);
}
