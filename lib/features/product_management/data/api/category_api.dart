import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/models/api_query_params.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/category_dto.dart';

abstract class CategoryApi {
  Future<CategoryDto> addNewCategory(String name);
  Future<List<CategoryDto>> getAllCategories();
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
  Future<List<CategoryDto>> getAllCategories() async {
    try {
      int currentPage = 1;
      List<CategoryDto> categories = [];
      bool hasNextPage = true;

      while (hasNextPage) {
        final response = await api.collection<CategoryDto>(
          ApiEndpoint.productCategories,
          queryParams: ApiQueryParams(page: currentPage).toJson(),
          converter: CategoryDto.fromJson,
        );
        if (response.items?.isNotEmpty == true) {
          categories.addAll(response.items!.toList());
          currentPage++;
        } else {
          hasNextPage = false;
        }
      }

      return categories;
    } catch (_) {
      rethrow;
    }
  }
}
