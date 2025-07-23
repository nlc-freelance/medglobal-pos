import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_payload.dart';

class CategoryApi {
  final BaseApiService _api;

  CategoryApi(this._api);

  Future<CategoryDto> createCategory(CategoryPayload payload) async {
    final response = await _api.post<CategoryDto>(
      ApiEndpoint.productCategories,
      data: payload.toJson(),
      fromJson: CategoryDto.fromJson,
    );

    return response.data;
  }

  Future<PaginatedList<CategoryDto>> getCategories(PageQuery query) async {
    final response = await _api.getPaginated<CategoryDto>(
      ApiEndpoint.productCategories,
      queryParams: query.toJson(),
      fromJson: CategoryDto.fromJson,
    );

    return PaginatedList<CategoryDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }
}
