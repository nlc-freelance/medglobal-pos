import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';

abstract class ProductVariantApi {
  Future<List<ProductVariantDto>> getProductVariants({int? supplierId, int? branchId, String? search});
}

class ProductVariantApiImpl implements ProductVariantApi {
  final BaseApiService _apiService;

  ProductVariantApiImpl(this._apiService);

  @override
  Future<List<ProductVariantDto>> getProductVariants({int? supplierId, int? branchId, String? search}) async {
    try {
      final response = await _apiService.getPaginated<ProductVariantDto>(
        '/products/variants',
        queryParams: {'size': 10, 'search': search, 'supplier': supplierId, 'branch': branchId},
        fromJson: ProductVariantDto.fromJson,
      );

      return response.data.items;
    } catch (_) {
      rethrow;
    }
  }
}
