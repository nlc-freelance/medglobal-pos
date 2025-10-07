import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';

class ProductVariantApi {
  final ApiService _api;

  ProductVariantApi({required ApiService api}) : _api = api;

  Future<List<ProductVariantDto>> getProductVariants({int? supplierId, int? branchId, String? search}) async {
    final data = await _api.getPaginated<ProductVariantDto>(
      '/products/variants',
      queryParams: {'size': 10, 'search': search, 'supplier': supplierId, 'branch': branchId},
      parser: (json) => parse(json, ProductVariantDto.fromJson),
    );

    return data.items;
  }
}
