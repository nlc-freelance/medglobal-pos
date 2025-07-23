import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/tax_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';

abstract class TaxRepository {
  /// Retrieves a list of all tax codes
  Future<Either<Failure, PaginatedList<Tax>>> getTaxCodes(PageQuery query);

  /// Check if there's a set default tax code
  Future<Either<Failure, Tax?>> getDefaultTaxCode();

  /// Retrieves a tax by [id]
  Future<Either<Failure, Tax>> getTaxCode(int id);

  /// Creates a new tax code
  Future<Either<Failure, Tax>> createTaxCode(TaxPayload payload);

  /// Updates an existing tax code by [id]
  Future<Either<Failure, Tax>> updateTaxCode(int id, TaxPayload payload);

  /// Deletes a tax code by [id]
  Future<Either<Failure, void>> deleteTaxCode(int id);
}
