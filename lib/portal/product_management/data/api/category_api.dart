import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_payload.dart';

class CategoryApi {
  final ApiService _api;

  CategoryApi(this._api);

  Future<CategoryDto> createCategory(CategoryPayload payload) async {
    final data = await _api.post<CategoryDto>(
      ApiEndpoint.productCategories,
      data: payload.toJson(),
      parser: (json) => parse(json, CategoryDto.fromJson),
    );

    return data;
  }

  Future<PaginatedList<CategoryDto>> getCategories(PageQuery query) async {
    final data = await _api.getPaginated<CategoryDto>(
      ApiEndpoint.productCategories,
      queryParams: query.toJson(),
      parser: (json) => parse(json, CategoryDto.fromJson),
    );

    return PaginatedList<CategoryDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }
}
