import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/features/stock_management/variants/product_variant_dto.dart';

abstract class ProductVariantApi {
  Future<List<ProductVariantDto>> getProductVariants({int? supplierId, int? branchId, String? search});
}

class ProductVariantApiImpl implements ProductVariantApi {
  final ApiService _apiService;

  ProductVariantApiImpl(this._apiService);

  @override
  Future<List<ProductVariantDto>> getProductVariants({int? supplierId, int? branchId, String? search}) async {
    try {
      final response = await _apiService.collection<ProductVariantDto>(
        '/products/variants',
        queryParams: {'size': 50, 'search': search, 'supplier': supplierId, 'branch': branchId},
        converter: ProductVariantDto.fromJson,
      );

      return response.items ?? [];
    } catch (_) {
      rethrow;
    }
  }
}
