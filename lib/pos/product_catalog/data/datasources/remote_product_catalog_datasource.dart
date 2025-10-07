import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';

class RemoteProductCatalogDataSource {
  final ApiService _api;

  RemoteProductCatalogDataSource({required ApiService api}) : _api = api;

  Future<PaginatedList<ProductVariantDto>> getProducts(PageQuery query, {bool isDeltaSync = false}) async {
    final data = await _api.getPaginated<ProductVariantDto>(
      isDeltaSync ? ApiEndpoints.productVariantsDeltaSync : ApiEndpoints.productVariants,
      queryParams: query.toJson(),
      parser: (json) => parse(json, ProductVariantDto.fromJson),
    );

    return PaginatedList<ProductVariantDto>(
      items: data.items,
      currentPage: data.page,
      currentSize: data.size,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }
}
