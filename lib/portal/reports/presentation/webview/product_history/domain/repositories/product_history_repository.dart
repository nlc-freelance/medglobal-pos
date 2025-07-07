import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/entities/product_history_paginated_list.dart';

abstract class ProductHistoryRepository {
  Future<Either<Failure, ProductHistoryPaginatedList>> getProductHistory({
    required int variantId,
    required int branchId,
    required String startDate,
    required int page,
    required int size,
  });
}
