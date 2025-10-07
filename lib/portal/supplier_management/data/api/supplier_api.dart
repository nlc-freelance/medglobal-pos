import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_dto.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_payload.dart';

class SupplierApi {
  final ApiService _api;

  SupplierApi({required ApiService api}) : _api = api;

  Future<PaginatedList<SupplierDto>> getSuppliers(PageQuery query) async {
    final data = await _api.getPaginated<SupplierDto>(
      ApiEndpoint.suppliers(),
      queryParams: query.toJson(),
      parser: (json) => parse(json, SupplierDto.fromJson),
    );

    return PaginatedList<SupplierDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<SupplierDto> getSupplier(int id) async {
    final data = await _api.get<SupplierDto>(
      ApiEndpoint.suppliers(id),
      parser: (json) => parse(json, SupplierDto.fromJson),
    );
    return data;
  }

  Future<SupplierDto> create(SupplierPayload payload) async {
    final data = await _api.post<SupplierDto>(
      ApiEndpoint.suppliers(),
      data: payload.toJson(),
      parser: (json) => parse(json, SupplierDto.fromJson),
    );

    return data;
  }

  Future<SupplierDto> update(int id, SupplierPayload payload) async {
    final data = await _api.update<SupplierDto>(
      ApiEndpoint.suppliers(id),
      data: payload.toJson(),
      parser: (json) => parse(json, SupplierDto.fromJson),
    );

    return data;
  }

  Future<void> delete(int id) async {
    return await _api.delete<SupplierDto>(ApiEndpoint.suppliers(id));
  }
}
