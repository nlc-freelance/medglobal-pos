import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/entities/product_history_paginated_list.dart';

abstract class ProductHistoryRepository {
  Future<ApiResult<ProductHistoryPaginatedList>> getProductHistory({
    required int variantId,
    required int branchId,
    required String startDate,
    required int page,
    required int size,
  });
}
