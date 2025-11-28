import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/dtos/product_sale_history_dto.dart';

class ProductSalesHistoryApi {
  final ApiService _api;

  ProductSalesHistoryApi({required ApiService api}) : _api = api;

  Future<ProductSaleHistoryDto> getProductSaleHistory(int variantId, PageQuery query) async {
    final data = await _api.get<ProductSaleHistoryDto>(
      ApiEndpoints.productSalesHistory(variantId),
      queryParams: query.toJson(),
      parser: (json) => parse(json, ProductSaleHistoryDto.fromJson),
    );
    return data;
  }
}
