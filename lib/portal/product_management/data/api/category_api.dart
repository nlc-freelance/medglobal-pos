import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category_paginated_list.dart';

abstract class CategoryApi {
  Future<CategoryDto> addNewCategory(String name);
  Future<CategoryPaginatedList> getCategories({required int page});
}

class CategoryApiImpl implements CategoryApi {
  final ApiService api;

  const CategoryApiImpl(this.api);

  @override
  Future<CategoryDto> addNewCategory(String name) async {
    try {
      return await api.post<CategoryDto>(
        ApiEndpoint.productCategories,
        data: CategoryDto(name: name).toJson(),
        converter: CategoryDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<CategoryPaginatedList> getCategories({required int page}) async {
    try {
      final response = await api.collection<CategoryDto>(
        ApiEndpoint.productCategories,
        queryParams: {'page': page, 'size': 10},
        converter: CategoryDto.fromJson,
      );

      return CategoryPaginatedList(
        categories: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }
}
