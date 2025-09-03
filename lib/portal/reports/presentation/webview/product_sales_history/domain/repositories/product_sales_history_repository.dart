import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history.dart';

abstract class ProductSalesHistoryRepository {
  Future<Either<Failure, ProductSaleHistory>> getProductSaleHistory(
    int variantId,
    PageQuery query,
  );
}
