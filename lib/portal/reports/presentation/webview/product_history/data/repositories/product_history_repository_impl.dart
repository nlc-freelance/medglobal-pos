import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/data/api/product_history_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/entities/product_history_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/repositories/product_history_repository.dart';

/// Concrete implementation of [ProductHistoryRepository] that uses [ProductHistoryApi] for API calls
/// and [BaseRepository] to centralize error handling.
class ProductHistoryRepositoryImpl extends BaseRepository implements ProductHistoryRepository {
  final ProductHistoryApi _api;

  ProductHistoryRepositoryImpl(this._api);

  @override
  Future<ApiResult<ProductHistoryPaginatedList>> getProductHistory({
    required int variantId,
    required int branchId,
    required String startDate,
    required int page,
    required int size,
  }) {
    return call(() async {
      final response = await _api.getProductHistory(
        page: page,
        size: size,
        variantId: variantId,
        branchId: branchId,
        startDate: startDate,
      );
      return response;
    });
  }
}
