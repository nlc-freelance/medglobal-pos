import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entities/tax.dart';

abstract class TaxRepository {
  /// Retrieves a list of all tax codes
  Future<Either<Failure, PaginatedList<Tax>>> getTaxCodes({int? page, int? size});

  /// Retrieves a tax by id
  Future<Either<Failure, Tax>> getTaxCode(int id);

  /// Creates a new tax code
  Future<Either<Failure, Tax>> createTaxCode(Tax tax);

  /// Updates an existing tax code
  Future<Either<Failure, Tax>> updateTaxCode(Tax tax);

  /// Deletes a tax code
  Future<Either<Failure, void>> deleteTaxCode(int id);
}
