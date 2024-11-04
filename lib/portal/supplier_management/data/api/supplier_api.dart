import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_dto.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier_paginated_list.dart';

abstract class SupplierApi {
  Future<SupplierPaginatedList> getSuppliers({required int page, required int size, String? search});
  Future<SupplierDto> getSupplier(int id);
  Future<void> create(Supplier supplier);
  Future<void> update(int id, Supplier supplier);
  Future<void> delete(int id);
}

class SupplierApiImpl implements SupplierApi {
  final ApiService api;

  const SupplierApiImpl(this.api);

  @override
  Future<SupplierPaginatedList> getSuppliers({required int page, required int size, String? search}) async {
    try {
      final response = await api.collection<SupplierDto>(
        ApiEndpoint.suppliers(),
        queryParams: {
          'page': page,
          'size': size,
          if (search != null && search != Strings.empty) 'search': search,
        },
        converter: SupplierDto.fromJson,
      );

      return SupplierPaginatedList(
        suppliers: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<SupplierDto> getSupplier(int id) async {
    try {
      return await api.get<SupplierDto>(ApiEndpoint.suppliers(id), converter: SupplierDto.fromJson);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> create(Supplier supplier) async {
    try {
      await api.post<SupplierDto>(
        ApiEndpoint.suppliers(),
        data: supplier.toJson(),
        converter: SupplierDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> update(int id, Supplier supplier) async {
    try {
      await api.update<SupplierDto>(
        ApiEndpoint.suppliers(id),
        data: supplier.toJson(),
        converter: SupplierDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await api.delete<SupplierDto>(ApiEndpoint.suppliers(id));
    } catch (_) {
      rethrow;
    }
  }
}
