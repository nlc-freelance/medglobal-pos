import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product_paginated_list.dart';

abstract class ProductApi {
  Future<void> bulkDelete(List<int> ids);
  Future<void> bulkUpdate(List<int> ids, Category? category);
  Future<ProductPaginatedList> getProducts(int page);
  Future<ProductDto> getProductById(int id);
  Future<void> create(Product product);
  Future<void> update(int id, Product product);
  Future<void> delete(int id);
}

class ProductApiImpl implements ProductApi {
  final ApiService _apiService;

  ProductApiImpl(this._apiService);

  @override
  Future<ProductPaginatedList> getProducts(int page) async {
    try {
      final response = await _apiService.collection<ProductDto>(
        ApiEndpoint.products(),
        queryParams: {'page': page, 'size': 5000},
        converter: ProductDto.fromJson,
      );

      return ProductPaginatedList(
        products: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> bulkDelete(List<int> ids) async {
    try {
      return await _apiService.delete<ProductDto>(
        ApiEndpoint.products(),
        data: {'ids': ids},
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> bulkUpdate(List<int> ids, Category? category) async {
    try {
      await _apiService.update<ProductDto>(
        ApiEndpoint.products(),
        data: {'category': category?.toJson(), 'productList': ids},
        converter: ProductDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ProductDto> getProductById(int id) async {
    try {
      return await _apiService.get<ProductDto>(
        ApiEndpoint.products(id),
        converter: ProductDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> create(Product product) async {
    try {
      await _apiService.post<ProductDto>(
        ApiEndpoint.products(),
        data: product.toProductPostRequest(),
        converter: ProductDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(int id, Product product) async {
    try {
      await _apiService.update<ProductDto>(
        ApiEndpoint.products(id),
        data: product.toProductPostRequest(),
        converter: ProductDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _apiService.delete<ProductDto>(ApiEndpoint.products(id));
    } catch (_) {
      rethrow;
    }
  }
}
