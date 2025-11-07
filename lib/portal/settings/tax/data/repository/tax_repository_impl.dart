import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/api/tax_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/tax_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/tax_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/repository/tax_repository.dart';

/// Concrete implementation of [TaxRepository] that uses [TaxApiService] for API calls
/// and [BaseRepository] to centralize error handling.
class TaxRepositoryImpl extends BaseRepository implements TaxRepository {
  final TaxApiService _api;

  TaxRepositoryImpl({required TaxApiService api}) : _api = api;

  @override
  Future<ApiResult<PaginatedList<Tax>>> getTaxCodes(PageQuery query) async {
    return call(() async {
      final response = await _api.getTaxCodes(query);
      final paginatedTax = response.convert((dto) => TaxMapper.fromDto(dto));

      return paginatedTax;
    });
  }

  @override
  Future<ApiResult<Tax>> getTaxCode(int id) async {
    return call(() async {
      final response = await _api.getTaxCodeById(id);
      return TaxMapper.fromDto(response);
    });
  }

  @override
  Future<ApiResult<Tax>> createTaxCode(TaxPayload payload) async {
    return call(() async {
      final response = await _api.createTaxCode(payload);
      return TaxMapper.fromDto(response);
    });
  }

  @override
  Future<ApiResult<Tax>> updateTaxCode(int id, TaxPayload payload) async {
    return call(() async {
      final response = await _api.updateTaxCode(id, payload);
      return TaxMapper.fromDto(response);
    });
  }

  @override
  Future<ApiResult<void>> deleteTaxCode(int id) async {
    return call(() async => await _api.deleteTaxCode(id));
  }

  @override
  Future<ApiResult<Tax?>> getDefaultTaxCode() async {
    return call(() async {
      final response = await _api.getDefaultTaxCode();
      if (response == null) return null;
      return TaxMapper.fromDto(response);
    });
  }
}
