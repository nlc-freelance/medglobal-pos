import 'package:medglobal_admin_portal/core/network/old_api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/data/dto/product_history_item_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/entities/product_history_paginated_list.dart';

class ProductHistoryApi {
  final ApiService _api;

  ProductHistoryApi({required ApiService api}) : _api = api;

  Future<ProductHistoryPaginatedList> getProductHistory({
    required int variantId,
    required int branchId,
    required String startDate,
    required int page,
    required int size,
  }) async {
    final data = await _api.getPaginated<ProductHistoryItemDto>(
      '/products/variants/$variantId/history',
      queryParams: {'page': page, 'size': size, 'branchId': branchId, 'startDate': startDate},
      parser: (json) => parse(json, ProductHistoryItemDto.fromJson),
    );

    return ProductHistoryPaginatedList(
      productHistoryItems: data.items.map((item) => item.toEntity()).toList(),
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }
}
