import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/tax_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';

abstract class TaxRepository {
  /// Retrieves a list of all tax codes
  Future<ApiResult<PaginatedList<Tax>>> getTaxCodes(PageQuery query);

  /// Check if there's a set default tax code
  Future<ApiResult<Tax?>> getDefaultTaxCode();

  /// Retrieves a tax by [id]
  Future<ApiResult<Tax>> getTaxCode(int id);

  /// Creates a new tax code
  Future<ApiResult<Tax>> createTaxCode(TaxPayload payload);

  /// Updates an existing tax code by [id]
  Future<ApiResult<Tax>> updateTaxCode(int id, TaxPayload payload);

  /// Deletes a tax code by [id]
  Future<ApiResult<void>> deleteTaxCode(int id);
}
