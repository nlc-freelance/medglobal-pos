import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category_dto.dart';

class CategoryApi {
  final BaseApiService _api;

  CategoryApi(this._api);

  Future<CategoryDto> addNewCategory(String name) async {
    final response = await _api.post<CategoryDto>(
      ApiEndpoint.productCategories,
      data: CategoryDto(name: name).toJson(),
      fromJson: CategoryDto.fromJson,
    );

    return response.data;
  }

  Future<PaginatedList<CategoryDto>> getCategories({required PageQuery filters}) async {
    final response = await _api.getPaginated<CategoryDto>(
      ApiEndpoint.productCategories,
      queryParams: filters.toJson(),
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
