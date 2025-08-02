import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';

class PosCatalogRemoteDatasource {
  final BaseApiService _api;

  PosCatalogRemoteDatasource(this._api);

  Future<PaginatedList<ProductVariantDto>> getProductCatalog(PageQuery query) async {
    final response = await _api.getPaginated<ProductVariantDto>(
      ApiEndpoints.productVariants,
      queryParams: query.toJson(),
      fromJson: ProductVariantDto.fromJson,
    );

    return PaginatedList<ProductVariantDto>(
      items: response.data.items,
      currentPage: response.data.page,
      currentSize: response.data.size,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }
}
