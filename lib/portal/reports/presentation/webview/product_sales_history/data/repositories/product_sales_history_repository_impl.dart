import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/api/product_sales_history_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/dtos/product_sale_history_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/repositories/product_sales_history_repository.dart';

/// Concrete implementation of [ProductSalesHistoryRepository] that uses [ProductSalesHistoryApi] for API calls
/// and [BaseRepository] to centralize error handling.
class ProductSalesHistoryRepositoryImpl extends BaseRepository implements ProductSalesHistoryRepository {
  final ProductSalesHistoryApi _api;

  ProductSalesHistoryRepositoryImpl({required ProductSalesHistoryApi api}) : _api = api;

  @override
  Future<ApiResult<ProductSaleHistory>> getProductSaleHistory(
    int variantId,
    PageQuery query,
  ) {
    return call(() async {
      final response = await _api.getProductSaleHistory(variantId, query);
      return response.toDomain();
    });
  }
}
