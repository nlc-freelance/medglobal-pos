import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/dtos/product_sale_history_dto.dart';

class ProductSalesHistoryApi {
  final BaseApiService _api;

  ProductSalesHistoryApi({required BaseApiService api}) : _api = api;

  Future<ProductSaleHistoryDto> getProductSaleHistory(int variantId, PageQuery query) async {
    print(query.toJson());
    final response = await _api.get<ProductSaleHistoryDto>(
      ApiEndpoints.productSalesHistory(variantId),
      queryParams: query.toJson(),
      fromJson: ProductSaleHistoryDto.fromJson,
    );
    return response.data;
  }
}
