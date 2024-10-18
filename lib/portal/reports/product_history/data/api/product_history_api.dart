import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/data/dto/product_history_item_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/domain/entities/product_history_paginated_list.dart';

abstract class ProductHistoryApi {
  Future<ProductHistoryPaginatedList> getProductHistory({
    required int variantId,
    required int branchId,
    required String startDate,
    required int page,
    required int size,
  });
}

class ProductHistoryApiImpl implements ProductHistoryApi {
  final ApiService api;

  const ProductHistoryApiImpl(this.api);

  @override
  Future<ProductHistoryPaginatedList> getProductHistory({
    required int variantId,
    required int branchId,
    required String startDate,
    required int page,
    required int size,
  }) async {
    try {
      final response = await api.collection<ProductHistoryItemDto>(
        '/products/variants/$variantId/history',
        queryParams: {'page': page, 'size': size, 'branchId': branchId, 'startDate': startDate},
        converter: ProductHistoryItemDto.fromJson,
      );

      return ProductHistoryPaginatedList(
        productHistoryItems: response.items?.map((item) => item).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (_) {
      rethrow;
    }
  }
}
