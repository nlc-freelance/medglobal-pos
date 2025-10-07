import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history.dart';

abstract class ProductSalesHistoryRepository {
  Future<ApiResult<ProductSaleHistory>> getProductSaleHistory(
    int variantId,
    PageQuery query,
  );
}
