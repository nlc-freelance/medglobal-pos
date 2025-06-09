import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_dto.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_request_dto.dart';

class SupplierApi {
  final BaseApiService _api;
  SupplierApi(this._api);

  Future<PaginatedList<SupplierDto>> getSuppliers({required PageQuery filters}) async {
    final response = await _api.getPaginated<SupplierDto>(
      ApiEndpoint.suppliers(),
      queryParams: filters.toJson(),
      fromJson: SupplierDto.fromJson,
    );

    return PaginatedList<SupplierDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<SupplierDto> getSupplier(int id) async {
    final response = await _api.get<SupplierDto>(
      ApiEndpoint.suppliers(id),
      fromJson: SupplierDto.fromJson,
    );
    return response.data;
  }

  Future<SupplierDto> create(SupplierRequestDto dto) async {
    final response = await _api.post<SupplierDto>(
      ApiEndpoint.suppliers(),
      data: dto.toJson(),
      fromJson: SupplierDto.fromJson,
    );

    return response.data;
  }

  Future<SupplierDto> update(int id, SupplierRequestDto dto) async {
    final response = await _api.update<SupplierDto>(
      ApiEndpoint.suppliers(id),
      data: dto.toJson(),
      fromJson: SupplierDto.fromJson,
    );

    return response.data;
  }

  Future<void> delete(int id) async {
    return await _api.delete<SupplierDto>(ApiEndpoint.suppliers(id));
  }
}
