import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/request/create_tax_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/request/update_tax_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/response/tax_dto.dart';

class TaxApi {
  final BaseApiService _api;

  TaxApi(this._api);

  Future<PaginatedList<TaxDto>> getTaxCodes({required FilterList filters}) async {
    final response = await _api.getPaginated<TaxDto>(
      ApiEndpoints.tax,
      queryParams: filters.toJson(),
      fromJson: TaxDto.fromJson,
    );

    return PaginatedList<TaxDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<TaxDto?> getDefaultTaxCode() async {
    final response = await _api.getPaginated(
      ApiEndpoints.tax,
      queryParams: {'isDefault': true},
      fromJson: TaxDto.fromJson,
    );

    for (final item in response.data.items) {
      if (item.isDefault) return item;
    }
    return null;
  }

  Future<TaxDto> getTaxCodeById(int id) async {
    final response = await _api.get(
      ApiEndpoints.taxById(id),
      fromJson: TaxDto.fromJson,
    );
    return response.data;
  }

  Future<TaxDto> createTaxCode(CreateTaxDto dto) async {
    final response = await _api.post(
      ApiEndpoints.tax,
      data: dto.toJson(),
      fromJson: TaxDto.fromJson,
    );
    return response.data;
  }

  Future<TaxDto> updateTaxCode(UpdateTaxDto dto) async {
    final response = await _api.update(
      ApiEndpoints.taxById(dto.id),
      data: dto.toJson(),
      fromJson: TaxDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteTaxCode(int id) async {
    return await _api.delete(ApiEndpoints.taxById(id));
  }
}
