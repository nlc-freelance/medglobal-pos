import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/models/api_query_params.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/category_dto.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/category_list_dto.dart';

abstract class CategoryApi {
  Future<CategoryDto> addNewCategory(String name);
  Future<CategoryListDto> getCategories(int page);
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
  Future<CategoryListDto> getCategories(int page) async {
    try {
      final response = await api.collection<CategoryDto>(
        ApiEndpoint.productCategories,
        queryParams: ApiQueryParams(page: page).toJson(),
        converter: CategoryDto.fromJson,
      );
      // print(response.items.toString());
      // print(response.pageInfo?.totalPages);
      // print(response.pageInfo?.page);

      return CategoryListDto(
        categories: response.items,
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
      );
    } catch (_) {
      rethrow;
    }
  }
}
