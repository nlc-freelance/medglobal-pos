import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/tax_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/tax_dto.dart';

class TaxApiService {
  final ApiService _api;

  TaxApiService({required ApiService api}) : _api = api;

  Future<PaginatedList<TaxDto>> getTaxCodes(PageQuery query) async {
    final data = await _api.getPaginated<TaxDto>(
      ApiEndpoints.tax,
      queryParams: query.toJson(),
      parser: (json) => parse(json, TaxDto.fromJson),
    );

    return PaginatedList<TaxDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<TaxDto?> getDefaultTaxCode() async {
    final data = await _api.getPaginated(
      ApiEndpoints.tax,
      queryParams: {'isDefault': true},
      parser: (json) => parse(json, TaxDto.fromJson),
    );

    for (final item in data.items) {
      if (item.isDefault) return item;
    }
    return null;
  }

  Future<TaxDto> getTaxCodeById(int id) async {
    final data = await _api.get(
      ApiEndpoints.taxById(id),
      parser: (json) => parse(json, TaxDto.fromJson),
    );
    return data;
  }

  Future<TaxDto> createTaxCode(TaxPayload payload) async {
    final data = await _api.post(
      ApiEndpoints.tax,
      data: payload.toJson(),
      parser: (json) => parse(json, TaxDto.fromJson),
    );
    return data;
  }

  Future<TaxDto> updateTaxCode(int id, TaxPayload payload) async {
    final data = await _api.update(
      ApiEndpoints.taxById(id),
      data: payload.toJson(),
      parser: (json) => parse(json, TaxDto.fromJson),
    );
    return data;
  }

  Future<void> deleteTaxCode(int id) async {
    return await _api.delete(ApiEndpoints.taxById(id));
  }
}
